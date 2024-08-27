import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/test_background_widget.dart';
import 'package:semu_cal/%08widgets/test_page_view_background.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/test/screen/real_test_page.dart';

// 여기서부터 class 별로 pageview 에 리스트 전달하면 됨
//

class TestMainPageView extends ConsumerStatefulWidget {
  const TestMainPageView({
    super.key,
  });

  @override
  ConsumerState<TestMainPageView> createState() => _TestMainPageViewState();
}

class _TestMainPageViewState extends ConsumerState<TestMainPageView> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {}

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) => onPageChanged(value),
          children: const [
            TestBackgroundWidget(child: RealTestViewWidget()),
          ],
        ),
        const TestPageViewBackground(),
      ],
    );
  }
}
