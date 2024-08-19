import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
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
              TypewriterAnimatedText('메모리에 저장된 연산들의 결과는'),
            ],
            pause: const Duration(milliseconds: 100),
            isRepeatingAnimation: false,
            // totalRepeatCount: 1,
            onFinished: () {
              setState(() {
                firstani = true;
              });
            },
          ),
          if (firstani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('MR 버튼을 눌러 확인할 수 있습니다'),
              ],
              pause: const Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                _startTimer(
                  100,
                  () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('MR', duration: 5000);

                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('4');

                    _startTimer(
                      1000,
                      () {
                        setState(() {
                          secondani = true;
                        });
                      },
                    );
                  },
                );
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('저장된 +20 과 +6 연산의 결과값 26이 출력됩니다'),
              ],
              pause: const Duration(milliseconds: 1000),
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
                TypewriterAnimatedText('이어서 M- 연산도 연습해보겠습니다'),
              ],
              pause: const Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
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
