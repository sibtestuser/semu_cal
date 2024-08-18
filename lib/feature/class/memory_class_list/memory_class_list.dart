import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_1 extends ConsumerStatefulWidget {
  MemoryClass_1({super.key});

  @override
  ConsumerState<MemoryClass_1> createState() => _MemoryClass_1State();
}

class _MemoryClass_1State extends ConsumerState<MemoryClass_1> {
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;

  @override
  Widget build(BuildContext context) {
    return ClassBackgroundWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('계산기에는 크게 2개의 메모리 공간이 있습니다'),
            ],
            isRepeatingAnimation: false,
            // totalRepeatCount: 1,
            onFinished: () {
              setState(() {
                firstani = true;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          if (firstani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('첫번째는 아래 계산기 M  영역이고'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('MR', duration: 5000);
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    secondani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 10,
          ),
          if (secondani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('두번째는 계산기 GT 영역입니다'),
              ],
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('GT', duration: 5000);
                setState(() {
                  thirdani = true;
                });
              },
            ),
          const SizedBox(
            height: 10,
          ),
          if (thirdani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('이 중 M 영역에 대해 알아보겠습니다'),
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
