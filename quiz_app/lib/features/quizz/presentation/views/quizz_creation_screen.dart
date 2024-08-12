import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_configure_screen.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_preview_screen.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_text_prompt_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizzCreationScreen extends StatefulWidget {
  const QuizzCreationScreen({super.key});

  static const routeName = '/quizz-creation';

  @override
  State<QuizzCreationScreen> createState() => _QuizzCreationScreenState();
}

class _QuizzCreationScreenState extends State<QuizzCreationScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(() {
        setState(() {
          _currentPage = _controller.page?.toInt() ?? 0;
        });
      });
    });
    super.initState();
  }

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
      const QuizzPreviewScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Create quizz',
        actions: [
          if (_currentPage == getPages().length - 1)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                child: SvgPicture.asset(
                  MediaRes.share,
                ),
              ),
            )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
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
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: getPages(),
          ),
        ],
      ),
    );
  }
}
