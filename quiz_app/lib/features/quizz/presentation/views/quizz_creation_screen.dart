import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/theme/app_color_scheme.dart';
import 'quizz_configure_screen.dart';
import 'quizz_preview_screen.dart';
import 'quizz_success_screen.dart';
import 'quizz_text_prompt_screen.dart';
import '../widgets/quit_quizz_creation_dialog.dart';
import '../../../../generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizzCreationScreen extends StatefulWidget {
  const QuizzCreationScreen({super.key});

  static const routeName = '/quizz-creation';

  @override
  State<QuizzCreationScreen> createState() => _QuizzCreationScreenState();
}

class _QuizzCreationScreenState extends State<QuizzCreationScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> getPages() {
    return [
      QuizzTextPromptScreen(
        pageController: _controller,
      ),
      QuizzConfigureScreen(
        pageController: _controller,
      ),
      QuizzPreviewScreen(
        pageController: _controller,
      ),
      const QuizzSuccessScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          title: S.of(context).quizzCreationAppBarTitle,
          onBack: () {
            QuitQuizzCreationDialog.show(context);
          }),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: _controller,
                count: getPages().length,
                effect: const WormEffect(
                  dotColor: AppColorScheme.secondary,
                  activeDotColor: AppColorScheme.primary,
                  dotHeight: 8,
                  dotWidth: 32,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: getPages(),
            ),
          ),
        ],
      ),
    );
  }
}
