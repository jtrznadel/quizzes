import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/common/widgets/basic_button.dart';
import '../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../core/common/widgets/secondary_button.dart';
import '../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../core/common/widgets/text_area.dart';
import '../../../core/common/widgets/text_divider.dart';
import '../../../core/errors/file_read_exception.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/res/media_res.dart';
import '../../../core/theme/app_color_scheme.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n.dart';

import '../../../core/services/file_reader.dart';
import '../application/quiz_generation_controller.dart';
import '../widgets/attachment_tile.dart';

enum QuizLanguage {
  English,
  Spanish,
  Polish,
  German,
  French,
  Italian,
}

class QuizzTextPromptPage extends ConsumerStatefulWidget {
  const QuizzTextPromptPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  ConsumerState createState() => _QuizzTextPromptPageState();
}

class _QuizzTextPromptPageState extends ConsumerState<QuizzTextPromptPage> {
  final _promptController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizzGenerationController =
        ref.read(quizGenerationControllerProvider.notifier);
    final state = ref.watch(quizGenerationControllerProvider);

    Future<void> handleFileUpload() async {
      try {
        if (!quizzGenerationController.validateFileUpload()) {
          ErrorSnackbar.show(
              context, S.of(context).quizzCreationMaxAttachmentsError);
          return;
        }
        final file = await FileReader.pickFileAndRead();
        quizzGenerationController.addAttachment(file);
      } on FileReadException catch (exception) {
        if (mounted) {
          if (context.mounted) {
            ErrorSnackbar.show(context, S.of(context).fileReadException);
          }
        } else {
          kDebugMode ? debugPrint(exception.toString()) : null;
        }
      }
    }

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize)
                  .copyWith(top: 0), //TODO: Remove top padding if needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).quizzCreationTextPromptHeading,
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    S.of(context).quizzCreationTextPromptSubheading,
                    style: context.textTheme.bodyMedium,
                  ),
                  const LargeVSpacer(),
                  Form(
                    key: _formKey,
                    child: TextArea(
                      labelText:
                          S.of(context).quizzCreationTextPromptTextAreaLabel,
                      hintText:
                          S.of(context).quizzCreationTextPromptTextAreaHint,
                      minLines: 5,
                      maxLines: 10,
                      controller: _promptController,
                      required: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppTheme.pageDefaultSpacingSize),
                    child: TextDivider(
                      text: S.of(context).dividerOr,
                      color: AppColorScheme.textSecondary,
                    ),
                  ),
                  SecondaryButton(
                    onPressed: () => handleFileUpload(),
                    text: S.of(context).quizzCreationUploadFile,
                    icon: SvgPicture.asset(
                      MediaRes.uploadFile,
                    ),
                    width: double.infinity,
                  ),
                  const MediumVSpacer(),
                  Text(
                    S.of(context).quizzCreationAttachFileMaxSize,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColorScheme.textSecondary),
                  ),
                  Text(
                    S.of(context).quizzCreationAttachFileAllowedTypes,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColorScheme.textSecondary),
                  ),
                  Column(
                    children: state.maybeWhen(
                      generating: (request) {
                        return request.attachments
                            .map((file) => AttachmentTile(fileName: file.name))
                            .toList();
                      },
                      orElse: () => [],
                    ),
                  ),
                  const MediumVSpacer(),
                  Text(
                    S.of(context).quizLanguageSelectionHeading,
                    style: context.textTheme.bodyMedium,
                  ),
                  const MediumVSpacer(),
                  const LanguageSelectionList(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 16,
            right: 16,
            child: Container(
              color: AppColorScheme.surface,
              padding: const EdgeInsets.only(top: 8),
              child: BasicButton(
                onPressed: () {
                  quizzGenerationController.setContent(_promptController.text);
                  if (quizzGenerationController.validateInput()) {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    ErrorSnackbar.show(context,
                        S.of(context).quizzCreationYouNeedToProvideContent);
                  }
                },
                text: S.of(context).continueButton,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LanguageSelectionList extends ConsumerWidget {
  const LanguageSelectionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(quizGenerationControllerProvider).maybeWhen(
          generating: (request) => QuizLanguage.values.firstWhere(
            (element) => element.name == request.language,
            orElse: () => QuizLanguage.English,
          ),
          orElse: () => QuizLanguage.English,
        );
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton2<QuizLanguage>(
              value: value,
              onChanged: (language) {
                ref
                    .read(quizGenerationControllerProvider.notifier)
                    .setLanguage(language ?? QuizLanguage.English);
              },
              iconStyleData: IconStyleData(
                icon: Row(
                  children: [
                    SvgPicture.asset(MediaRes.arrowDropdown),
                    const SmallHSpacer(),
                  ],
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(AppTheme.radiusFull),
                  thumbColor: WidgetStateProperty.all(AppColorScheme.primary),
                ),
                maxHeight: AppTheme.dropdownListMaxHeight,
                offset: AppTheme.dropdownListOffset,
              ),
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColorScheme.border,
                      width: AppTheme.dropdownBorderWidth),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
              ),
              items: dropdownMenuEntries(),
            ),
          ),
        ),
      );
    });
  }

  List<DropdownMenuItem<QuizLanguage>> dropdownMenuEntries() => [
        DropdownMenuItem(
          value: QuizLanguage.English,
          child: Text(
            QuizLanguage.English.name,
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: QuizLanguage.Spanish,
          child: Text(
            QuizLanguage.Spanish.name,
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: QuizLanguage.Polish,
          child: Text(
            QuizLanguage.Polish.name,
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: QuizLanguage.German,
          child: Text(
            QuizLanguage.German.name,
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: QuizLanguage.French,
          child: Text(
            QuizLanguage.French.name,
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: QuizLanguage.Italian,
          child: Text(
            QuizLanguage.Italian.name,
            style: textTheme.bodyMedium,
          ),
        ),
      ];
}
