import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_5 extends ConsumerStatefulWidget {
  const MemoryClass_5({super.key});

  @override
  ConsumerState<MemoryClass_5> createState() => _MemoryClass_5State();
}

class _MemoryClass_5State extends ConsumerState<MemoryClass_5> {
  bool startani = false;
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  bool fourthani = false;
  bool fifthani = false;
  final List<Timer> _timers = [];

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        startani = true;
      });
    });
  }

  @override
  void dispose() {
    for (var timer in _timers) {
      timer.cancel();
    }
    super.dispose();
  }

  void _startTimer(int duration, VoidCallback callback) {
    _timers.add(Timer(Duration(milliseconds: duration), () {
      if (mounted) {
        callback();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ClassBackgroundWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('메모리에 저장된 결과는 어떻게 확인할까요? '),
            ],
            pause: const Duration(milliseconds: 100),
            isRepeatingAnimation: false,
            // totalRepeatCount: 1,
            onFinished: () {
              _startTimer(10, () {
                ref.read(displayControllerProvider.notifier).makeReset();
                ref
                    .read(displayControllerProvider.notifier)
                    .addMemoryList(6, context);
                ref
                    .read(displayControllerProvider.notifier)
                    .addMemoryList(20, context);
                _startTimer(300, () {
                  setState(() {
                    firstani = true;
                  });
                });
              });
            },
          ),
          const SizedBox(height: 5),
          if (firstani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('계산기 MR(Memory Recall) 버튼을 누르면 '),
              ],
              pause: const Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                _startTimer(
                  10,
                  () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('MR', duration: 2000);
                  },
                );
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
                TypewriterAnimatedText('메모리에 저장된 연산들을 수행하여'),
              ],
              pause: const Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                _startTimer(10, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('26');
                });
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
                TypewriterAnimatedText('+6 + 20 = 26 '),
              ],
              pause: const Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                setState(() {
                  fourthani = true;
                });
              },
            ),
          const SizedBox(height: 5),
          if (fourthani)
            MyAnimatedText(
              text: '연산의 결과값을 디스플레이에 보여줍니다',
              onFinished: () {
                setState(() {
                  fifthani = true;
                });
              },
            ),
          const SizedBox(height: 5),
          if (fifthani)
            MyAnimatedText(
              text: 'Recall이 와닿지 않으면 메모리 리드라고 생각해보세요',
              onFinished: () {
                _startTimer(
                  100,
                  () {
                    ref.read(classModelProvider.notifier).setNextPage(true);
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
