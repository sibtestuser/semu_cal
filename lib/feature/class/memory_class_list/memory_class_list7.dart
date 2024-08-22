import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_7 extends ConsumerStatefulWidget {
  const MemoryClass_7({super.key});

  @override
  ConsumerState<MemoryClass_7> createState() => _MemoryClass_7State();
}

class _MemoryClass_7State extends ConsumerState<MemoryClass_7> {
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
                      '(4x5) - (2x3)',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black), // 글자색을 검은색으로 설정
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 5,
          ),
          MyAnimatedText(
              text: '4 x 5는 + 연산 2 x 3 은 - 연산입니다',
              onFinished: () {
                ref.read(displayControllerProvider.notifier).makeReset();
                setState(() {
                  firstani = true;
                });
              }),
          if (firstani)
            MyAnimatedText(
              text: '4 x 5 그리고 M+ 를 눌러 메모리에 저장하고',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('4');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('4');
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('x');
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('x');

                      _startTimer(200, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('5');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('5');

                        _startTimer(200, () {
                          ref
                              .read(displayControllerProvider.notifier)
                              .setTouchButton('M+', duration: 500);
                          ref
                              .read(displayControllerProvider.notifier)
                              .addMemoryList(20, context);
                          _startTimer(200, () {
                            setState(() {
                              secondani = true;
                            });
                          });
                        });
                      });
                    });
                  });
                });
              },
            ),
          if (secondani)
            MyAnimatedText(
              text: '그 다음 마니어스 연산인 2 x 3 을 입력 후',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('2');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2');
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('x');
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('x');

                      _startTimer(200, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('3');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('3');

                        _startTimer(200, () {
                          _startTimer(200, () {
                            setState(() {
                              thirdani = true;
                            });
                          });
                        });
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
              text: ' M- 를 눌러 마니어스 연산을 메모리에 저장',
              onFinished: () {
                _startTimer(200, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('M-', duration: 500);
                  ref
                      .read(displayControllerProvider.notifier)
                      .addMemoryList(-6, context);
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
              text: '저장된 연산의 결과값을 보기 위해 MR 을 누르면',
              onFinished: () {
                _startTimer(200, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('MR', duration: 500);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('14');
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
              text: '20 -6 = 14 를 확인할 수 있습니다',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
