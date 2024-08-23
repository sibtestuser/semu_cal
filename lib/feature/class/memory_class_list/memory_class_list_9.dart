import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_9 extends ConsumerStatefulWidget {
  const MemoryClass_9({super.key});

  @override
  ConsumerState<MemoryClass_9> createState() => _MemoryClass_9State();
}

class _MemoryClass_9State extends ConsumerState<MemoryClass_9> {
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
              text: '이번에는 조금 응용해 보겠습니다.',
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
              height: startani ? 55 : 0,
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
                      child: Column(
                        children: [
                          Text(
                            '(2 x 3) - (4 x 5) ',

                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black), // 글자색을 검은색으로 설정
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '2',

                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black), // 글자색을 검은색으로 설정
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
              text: '(2 x 3) M+ 그리고 (4 x 5) M- 로 분자를 계산 후 메모리 저장',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .addMemoryList(6, context);
                  ref
                      .read(displayControllerProvider.notifier)
                      .addMemoryList(-20, context);

                  _startTimer(500, () {
                    setState(() {
                      secondani = true;
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
              text: '그 다음 MR 로 분자의 결과값을 가져오고',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('MR');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('-14');
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                  _startTimer(1000, () {
                    ref.read(displayControllerProvider.notifier).setTouchButton(
                          '÷',
                          duration: 500,
                        );
                    _startTimer(500, () {
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
              text: '그 다음 분모 2로 나눠 결과를 얻습니다',
              onFinished: () {
                _startTimer(1000, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('2');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2');
                  _startTimer(1000, () {
                    ref.read(displayControllerProvider.notifier).setTouchButton(
                          '=',
                          duration: 500,
                        );
                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('-7');
                  });
                });
              },
            ),
          // const SizedBox(
          //   height: 5,
          // ),
          // if (fourthani)
          //   MyAnimatedText(
          //     text: '+ 대신에 M+ 그리고 - 대신 M- 를 사용하여',
          //     onFinished: () {
          //       _startTimer(200, () {
          //         _startTimer(200, () {
          //           setState(() {
          //             fifthani = true;
          //           });
          //         });
          //       });
          //     },
          //   ),
        ],
      ),
    );
  }
}
