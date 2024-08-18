import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_3 extends ConsumerStatefulWidget {
  MemoryClass_3({super.key});

  @override
  ConsumerState<MemoryClass_3> createState() => _MemoryClass_3State();
}

class _MemoryClass_3State extends ConsumerState<MemoryClass_3> {
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;

  @override
  Widget build(BuildContext context) {
    return ClassBackgroundWidget(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('메모리는  앞 페이지의 노트 역활을 합니다'),
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
              height: 5,
            ),
            if (firstani)
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('M+ 는 더하기 연산을 메모리에 메모하고'),
                ],
                isRepeatingAnimation: false,
                //  totalRepeatCount: 1,
                onFinished: () {
                  setState(() {
                    secondani = true;
                  });
                },
              ),
            const SizedBox(
              height: 5,
            ),
            if (secondani)
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('M- 는 빼기 연산을 메모리에 메모합니다'),
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
                  TypewriterAnimatedText('이전 페이지의 문제를 메모리를 이용해 계산해보겠습니다'),
                ],
                isRepeatingAnimation: false,
                //  totalRepeatCount: 1,
                onFinished: () {
                  ref.read(classModelProvider.notifier).setNextPage(true);
                },
              ),
          ],
        ),
      ),
    );
  }
}
