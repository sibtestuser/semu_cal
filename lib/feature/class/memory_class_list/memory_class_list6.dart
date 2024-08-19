import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_6 extends ConsumerStatefulWidget {
  const MemoryClass_6({super.key});

  @override
  ConsumerState<MemoryClass_6> createState() => _MemoryClass_6State();
}

class _MemoryClass_6State extends ConsumerState<MemoryClass_6> {
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
              TypewriterAnimatedText('여기서 잠깐!!   메모리 영역을 봐주세요'),
            ],
            pause: const Duration(milliseconds: 100),
            isRepeatingAnimation: false,
            // totalRepeatCount: 1,
            onFinished: () {
              _startTimer(10, () {
                ref
                    .read(displayControllerProvider.notifier)
                    .addMemoryList(6, context);
                ref
                    .read(displayControllerProvider.notifier)
                    .addMemoryList(20, context);
                _startTimer(1000, () {
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
                TypewriterAnimatedText('메모리는 저절로 지워지지 않습니다'),
              ],
              pause: const Duration(milliseconds: 100),
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
                TypewriterAnimatedText('계산기 출력화면 왼쪽 상단에  M 마크가'),
              ],
              pause: const Duration(milliseconds: 100),
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
                TypewriterAnimatedText('메모리에 저장된 값이 있다는 걸 보여줍니다'),
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
          const SizedBox(
            height: 5,
          ),
          if (fourthani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('연습앱에는 없지만 계산기의 MC 버튼을 눌러'),
              ],
              pause: const Duration(milliseconds: 500),
              isRepeatingAnimation: false,
              //  totalRepeatCount: 1,
              onFinished: () {
                setState(() {
                  fifthani = true;
                });
                _startTimer(500, () {
                  ref.read(displayControllerProvider.notifier).makeReset();
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fifthani)
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('새로운 계산에 앞서 메모리를 꼭 클리어 해주세요'),
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
