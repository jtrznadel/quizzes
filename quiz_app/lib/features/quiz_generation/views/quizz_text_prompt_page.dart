import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/common/widgets/basic_button.dart';
import '../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../core/common/widgets/secondary_button.dart';
import '../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../core/common/widgets/text_area.dart';
import '../../../core/common/widgets/text_divider.dart';
import '../../../core/errors/file_read_exception.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/res/media_res.dart';
import '../../../core/theme/app_color_scheme.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n.dart';

import '../../../core/services/file_reader.dart';
import '../application/quiz_generation_controller.dart';
import '../widgets/attachment_tile.dart';

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
    final quizzGenerationController = ref.read(quizGenerationControllerProvider.notifier);
    final state = ref.watch(quizGenerationControllerProvider);
    final List<MultipartFile> files = state.maybeWhen(
      generating: (quiz) => quiz.attachments,
      orElse: () => const [],
    );

    Future<void> handleFileUpload() async {
      try {
        if (files.length >= 3) {
          ErrorSnackbar.show(context, S.of(context).quizzCreationMaxAttachmentsError);
          return;
        }
        final file = await FileReader.pickFileAndRead();
        state.maybeWhen(
          generating: (request) {
            request = request.copyWith(attachments: [...request.attachments, FileReader.toMultipartFile(file)]);
            quizzGenerationController.modifyRequest(request);
          },
          orElse: () {},
        );
      } on FileReadException catch (exception) {
        if (mounted) {
          if (context.mounted) ErrorSnackbar.show(context, S.of(context).fileReadException);
        } else {
          kDebugMode ? debugPrint(exception.toString()) : null;
        }
      }
    }

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(top: 0), //TODO: Remove top padding if needed
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
                  const ExtraLargeVSpacer(),
                  Form(
                    key: _formKey,
                    child: TextArea(
                      labelText: S.of(context).quizzCreationTextPromptTextAreaLabel,
                      hintText: S.of(context).quizzCreationTextPromptTextAreaHint,
                      minLines: 5,
                      maxLines: 15,
                      controller: _promptController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppTheme.pageDefaultSpacingSize),
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
                    style: context.textTheme.bodySmall?.copyWith(color: AppColorScheme.textSecondary),
                  ),
                  Text(
                    S.of(context).quizzCreationAttachFileAllowedTypes,
                    style: context.textTheme.bodySmall?.copyWith(color: AppColorScheme.textSecondary),
                  ),
                  Column(
                    children: files.map((file) => AttachmentTile(fileName: file.filename ?? '')).toList(),
                  ),
                  const ExtraLargeVSpacer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              color: AppColorScheme.surface,
              padding: const EdgeInsets.only(top: 8),
              child: BasicButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    state.maybeWhen(
                      generating: (request) {
                        request = request.copyWith(content: _promptController.text);
                        quizzGenerationController.modifyRequest(request);
                      },
                      orElse: () {},
                    );
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
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
