import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/%08widgets/x_year_widget.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class KClass_6 extends ConsumerStatefulWidget {
  const KClass_6({super.key});

  @override
  ConsumerState<KClass_6> createState() => _KClass_6State();
}

class _KClass_6State extends ConsumerState<KClass_6> {
  bool startani = false;
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  bool fourthani = false;
  bool fifthani = false;
  String x0 = '';
  String x1 = '';
  String x2 = '';
  String x3 = '100';
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
          X3YearWidget(x0: x0, x1: x1, x2: x2, x3: x3),
          const SizedBox(
            height: 10,
          ),
          MyAnimatedText(
              text: '이번엔 시장이자율 10%, 액면가액 100원 사채의 현재가치를 구해보겠습니다. ',
              onFinished: () {
                _startTimer(10, () {
                  ref.read(displayControllerProvider.notifier).makeReset();
                  setState(() {
                    firstani = true;
                  });
                });
              }),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
              text: '반복할 연산  1.1 나누기를 먼저 입력합니다',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('1');

                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('1');
                  _startTimer(500, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('.');
                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('1.');

                    _startTimer(500, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('1');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('1.1');

                      _startTimer(500, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('÷');
                        _startTimer(500, () {
                          ref
                              .read(displayControllerProvider.notifier)
                              .setTouchButton('÷');
                          ref
                              .read(displayControllerProvider.notifier)
                              .updateK(operationEnum.divide);
                          _startTimer(500, () {
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
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyAnimatedText(
                  text: '초기값 100 을 입력하고 = 을 3번 누르면',
                  onFinished: () {
                    _startTimer(400, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('1');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('1');
                      _startTimer(400, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('0');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('10');
                        _startTimer(400, () {
                          ref
                              .read(displayControllerProvider.notifier)
                              .setTouchButton('0');
                          ref
                              .read(displayControllerProvider.notifier)
                              .updateTempOutput('100');
                          _startTimer(1000, () {
                            ref
                                .read(displayControllerProvider.notifier)
                                .setTouchButton('=');
                            ref
                                .read(displayControllerProvider.notifier)
                                .updateTempOutput('90.91');
                            ref
                                .read(displayControllerProvider.notifier)
                                .addGTList(90.91);
                            setState(() {
                              x2 = '90.91';
                            });

                            _startTimer(1000, () {
                              ref
                                  .read(displayControllerProvider.notifier)
                                  .setTouchButton('=');
                              ref
                                  .read(displayControllerProvider.notifier)
                                  .updateTempOutput('82.64');
                              ref
                                  .read(displayControllerProvider.notifier)
                                  .addGTList(82.64);
                              setState(() {
                                x1 = '82.64';
                              });

                              _startTimer(1000, () {
                                ref
                                    .read(displayControllerProvider.notifier)
                                    .setTouchButton('=');

                                setState(() {
                                  x0 = '75.13';
                                });
                                ref
                                    .read(displayControllerProvider.notifier)
                                    .updateTempOutput('75.13');
                                ref
                                    .read(displayControllerProvider.notifier)
                                    .addGTList(75.13);

                                _startTimer(500, () {
                                  setState(() {
                                    thirdani = true;
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  },
                ),
              ],
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            MyAnimatedText(
              text: 'x0 현재가치는 물론 x1, x2 년도의 현재가치도 GT에 저장되어 있는 점도 눈여겨 봐주세요',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
                setState(() {
                  fourthani = true;
                });
              },
            ),
        ],
      ),
    );
  }
}
