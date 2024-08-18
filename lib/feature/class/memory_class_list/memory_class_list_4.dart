import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_4 extends ConsumerStatefulWidget {
  MemoryClass_4({super.key});

  @override
  ConsumerState<MemoryClass_4> createState() => _MemoryClass_4State();
}

class _MemoryClass_4State extends ConsumerState<MemoryClass_4> {
  bool startani = false;
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  bool fourthani = false;

  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        startani = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClassBackgroundWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: startani ? 30 : 0,
            color: Colors.white, // 배경색을 하얀색으로 설정
            child: startani
                ? const Center(
                    child: Text(
                      '(2x3) + (4x5)',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 5,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('먼저 2x3 을 누른 후 '),
            ],
            isRepeatingAnimation: false,
            // totalRepeatCount: 1,
            onFinished: () {
              ref
                  .read(displayControllerProvider.notifier)
                  .setTouchButton('2', duration: 5000);
              ref
                  .read(displayControllerProvider.notifier)
                  .updateTempOutput('2');
              Future.delayed(const Duration(milliseconds: 500), () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('x', duration: 5000);
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('x');

                // 다시 0.3초 후에 세 번째 연산을 실행
                Future.delayed(const Duration(milliseconds: 500), () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('3', duration: 1000);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('3');
                  setState(() {
                    firstani = true;
                  });
                });
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('더하기(양수) 연산이므로 M+ 버튼을 누르면'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('M+', duration: 2000);
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('6');
                ref
                    .read(displayControllerProvider.notifier)
                    .addMemoryList(6, context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    secondani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('메모리 영역에 (+)6이 저장(메모) 됩니다.'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                setState(() {
                  thirdani = true;
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('더하기 연산인 4x5 도 메모리에 더해주면'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('4', duration: 5000);
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('4');

                // 0.3초 후에 두 번째 연산을 실행
                Future.delayed(const Duration(milliseconds: 300), () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('x', duration: 5000);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('x');

                  // 다시 0.3초 후에 세 번째 연산을 실행
                  Future.delayed(const Duration(milliseconds: 300), () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('5', duration: 5000);
                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('5');

                    // 마지막으로 0.3초 후에 네 번째 연산을 실행
                    Future.delayed(const Duration(milliseconds: 300), () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('M+', duration: 5000);
                      ref
                          .read(displayControllerProvider.notifier)
                          .addMemoryList(20, context);
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('20');
                      setState(() {
                        fourthani = true;
                      });
                    });
                  });
                });
              },
            ),
          const SizedBox(height: 5),
          if (fourthani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('노트에 메모한 것과 동일한 값이 저장되었습니다'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
