import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewBackGroundWidget extends ConsumerWidget {
  final PageController pageController;

  const PageViewBackGroundWidget({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classModel = ref.watch(classModelProvider);
    //classModel.goNextPage = true;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: IconButton(
                    icon: Transform.rotate(
                      angle: 3.14, // 180도 회전
                      child: Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: Colors.grey[300],
                      ),
                    ),
                    onPressed: () {
                      // ref.read(displayControllerProvider.notifier).makeReset();
                      ref.read(classModelProvider.notifier).setNextPage(false);
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                classModel.goNextPage
                    ? Pulse(
                        infinite: true,
                        // from: 10,
                        child: IconButton(
                          icon: Opacity(
                            opacity: 0.6,
                            child: Icon(
                              Icons.play_arrow,
                              size: 40,
                              color: Colors.red[500],
                            ),
                          ),
                          onPressed: () {
                            // ref
                            //     .read(displayControllerProvider.notifier)
                            //     .makeReset();
                            // ref
                            //     .read(classModelProvider.notifier)
                            //     .setNextPage(false);
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      )
                    : Opacity(
                        opacity: 0.5,
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.grey[300],
                          ),
                          onPressed: () {
                            // ref
                            //     .read(displayControllerProvider.notifier)
                            //     .makeReset();
                            // ref
                            //     .read(classModelProvider.notifier)
                            //     .setNextPage(false);
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: classModel.classWidgetList.length,

                  effect: WormEffect(
                    dotWidth: 10.0,
                    dotHeight: 12.0,
                    spacing: 6.0,
                    dotColor: Colors.grey[500]!,
                    activeDotColor: Colors.yellow[800]!,

                    // 추가적인 속성들을 필요에 따라 설정할 수 있습니다.
                  ),
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }, // 원하는 효과를 선택하세요.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
