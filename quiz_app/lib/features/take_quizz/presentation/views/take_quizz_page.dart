import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/loading_indicator.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../quizz_details/domain/quiz_details_model.dart';
import '../../application/quizz_take_controller.dart';
import '../../domain/quiz_response_model.dart';
import '../widgets/quit_quizz_taking_dialog.dart';

@RoutePage()
class TakeQuizzPage extends ConsumerStatefulWidget {
  const TakeQuizzPage({super.key});

  @override
  ConsumerState<TakeQuizzPage> createState() => _TakeQuizzPageState();
}

class _TakeQuizzPageState extends ConsumerState<TakeQuizzPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(quizzTakeControllerProvider.notifier).startQuizz(id: '5c722313'));
    //TODO: Remove when the real implementation is done and UI handle it //93b48c1a-3c1b-48d1-816d-5a7110cecc20
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final quizState = ref.watch(quizzTakeControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BasicAppBar(
        title: S.of(context).quizzTakeAppBarTitle,
        onBack: () {
          QuitQuizzTakingDialog.show(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quizzTakeHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              S.of(context).quizzTakeSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const LargeVSpacer(),
            Form(
              key: formKey,
              child: IFormField(
                labelText: S.of(context).quizzTakeFormFieldLabel,
                hintText: S.of(context).quizzTakeFormFieldHint,
                controller: usernameController,
              ),
            ),
            const LargeVSpacer(),
            quizState.maybeWhen(
              loaded: (quiz, userNaswers, currentStep) => TakeQuizzInfoBox(quizModel: quiz.quizResponse),
              orElse: () => const LoadingIndicator(),
            ),
            const LargeVSpacer(),
            BasicButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.router.push(
                    const TakeQuizzWraperRoute(),
                  );
                }
              },
              text: 'Start Quizz',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class TakeQuizzInfoBox extends StatelessWidget {
  const TakeQuizzInfoBox({
    super.key,
    required this.quizModel,
  });

  final QuizResponseModel quizModel;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColorScheme.border,
      strokeWidth: 1.5,
      dashPattern: const [4, 4],
      radius: const Radius.circular(8),
      borderType: BorderType.RRect,
      borderPadding: const EdgeInsets.all(0.5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.takeQuizzInfoContainerPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.takeQuizzInfoContainerBorderRadius),
          color: AppColorScheme.surfaceContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quizModel.title,
              style: context.textTheme.headlineMedium,
            ),
            const MediumVSpacer(),
            Text(
              quizModel.description,
              style: context.textTheme.bodyLarge,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
