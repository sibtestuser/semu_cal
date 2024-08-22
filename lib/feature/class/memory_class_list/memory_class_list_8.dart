import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_8 extends ConsumerStatefulWidget {
  const MemoryClass_8({super.key});

  @override
  ConsumerState<MemoryClass_8> createState() => _MemoryClass_8State();
}

class _MemoryClass_8State extends ConsumerState<MemoryClass_8> {
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
          MyAnimatedText(
              text: '간단한 연산에도 Memory 를 활용할 수 있습니다',
              onFinished: () {
                ref.read(displayControllerProvider.notifier).makeReset();
                setState(() {
                  firstani = true;
                });
              }),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: startani ? 30 : 0,
              decoration: BoxDecoration(
                color: Colors.white, // 배경색을 하얀색으로 설정
                boxShadow: startani
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // 그림자의 위치 조정
                        ),
                      ]
                    : [],
              ),
              child: startani
                  ? const Center(
                      child: Text(
                        '-3 + 5',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // 글자색을 검은색으로 설정
                      ),
                    )
                  : null,
            ),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
              text: '빼기 연산인 3을 입력 후 M-',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('3');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('3');
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('M-', duration: 500);
                    ref
                        .read(displayControllerProvider.notifier)
                        .addMemoryList(-3, context);
                    _startTimer(200, () {
                      setState(() {
                        secondani = true;
                      });
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            MyAnimatedText(
              text: '그 다음 더하기 연산인 5 입력 후 M+',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('5');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('5');
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('M+', duration: 500);
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .addMemoryList(5, context);
                      setState(() {
                        thirdani = true;
                      });
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            MyAnimatedText(
              text: ' 그 다음 MR 버튼으로 계산 결과 확인 ',
              onFinished: () {
                _startTimer(200, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('MR', duration: 500);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2');
                  _startTimer(200, () {
                    setState(() {
                      fourthani = true;
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fourthani)
            MyAnimatedText(
              text: '+ 대신에 M+ 그리고 - 대신 M- 를 사용하여',
              onFinished: () {
                _startTimer(200, () {
                  _startTimer(200, () {
                    setState(() {
                      fifthani = true;
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fifthani)
            MyAnimatedText(
              text: '동일한 계산을 수행할 수 있습니다',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
