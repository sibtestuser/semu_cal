import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/page_view_background.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

// 여기서부터 class 별로 pageview 에 리스트 전달하면 됨
//

class ClassMainPageView extends ConsumerStatefulWidget {
  const ClassMainPageView({
    super.key,
  });

  @override
  ConsumerState<ClassMainPageView> createState() => _ClassMainPageViewState();
}

class _ClassMainPageViewState extends ConsumerState<ClassMainPageView> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    ref.read(displayControllerProvider.notifier).makeReset();
    ref.read(calculatorControllerProvider.notifier).makeReset();
    ref.read(classModelProvider.notifier).setNextPage(false);
    print('page changed');
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final classModel = ref.watch(classModelProvider);
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) => onPageChanged(value),
          children: classModel.classWidgetList,
          // children: [
          //   ClassBackgroundWidget(
          //     child: Container(
          //       child: Text(
          //         'Page 1',
          //       ),
          //     ),
          //   ),
          //   Container(
          //     color: Colors.blue,
          //   ),
          //   Container(
          //     color: Colors.green,
          //   ),
          // ],
        ),
        PageViewBackGroundWidget(
          pageController: pageController,
        ),
      ],
    );
  }
}
