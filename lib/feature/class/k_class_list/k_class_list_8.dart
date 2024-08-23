import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/%08widgets/x_year_widget.dart';
import 'package:semu_cal/%08widgets/x_year_widget_with_pv.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class KClass_8 extends ConsumerStatefulWidget {
  const KClass_8({super.key});

  @override
  ConsumerState<KClass_8> createState() => _KClass_8State();
}

class _KClass_8State extends ConsumerState<KClass_8> {
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
  String pv0 = '';
  String pv1 = '';
  String pv2 = '';
  String pv3 = '';

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
          X3YearWidgetWithPV(
            x0: x0,
            x1: '100',
            x2: '100',
            x3: '100',
            pv0: pv0,
            pv1: pv1,
            pv2: pv2,
            pv3: pv3,
          ),
          const SizedBox(
            height: 10,
          ),
          MyAnimatedText(
              text: '반복할 연산 1.1 나누기와 초기값 100을 입력하고',
              onFinished: () {
                _startTimer(10, () {
                  ref.read(displayControllerProvider.notifier).makeReset();
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
                            ref
                                .read(displayControllerProvider.notifier)
                                .setTouchButton('1');
                            ref
                                .read(displayControllerProvider.notifier)
                                .updateTempOutput('1');
                            _startTimer(500, () {
                              ref
                                  .read(displayControllerProvider.notifier)
                                  .setTouchButton('0');
                              ref
                                  .read(displayControllerProvider.notifier)
                                  .updateTempOutput('10');
                              _startTimer(500, () {
                                ref
                                    .read(displayControllerProvider.notifier)
                                    .setTouchButton('0');
                                ref
                                    .read(displayControllerProvider.notifier)
                                    .updateTempOutput('100');
                                _startTimer(1000, () {
                                  setState(() {
                                    firstani = true;
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              }),
          const SizedBox(
            height: 3,
          ),
          if (firstani)
            MyAnimatedText(
              text: '= 을 누르면 x1 의 현재가치가 GT에 저장',
              onFinished: () {
                _startTimer(1000, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=');
                  ref.read(displayControllerProvider.notifier).addGTList(90.90);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('90.90');
                  setState(() {
                    pv1 = '90.90';
                  });
                  _startTimer(1000, () {
                    setState(() {
                      secondani = true;
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (secondani)
            MyAnimatedText(
              text: '다시한번 = 을 누르면 x2 의 현재가치가 GT에 저장',
              onFinished: () {
                _startTimer(10, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=');
                  ref.read(displayControllerProvider.notifier).addGTList(82.64);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('82.64');
                  setState(() {
                    pv2 = '82.64';
                  });
                  _startTimer(1000, () {
                    setState(() {
                      thirdani = true;
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '한번 더 누르면 x3년도의 현재가치가 GT에 저장',
              onFinished: () {
                _startTimer(10, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=');
                  ref.read(displayControllerProvider.notifier).addGTList(75.13);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('75.13');
                  setState(() {
                    pv3 = '75.13';
                  });
                  _startTimer(1000, () {
                    setState(() {
                      thirdani = true;
                    });
                  });
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '이제 GT 버튼으로 이들의 총합을 구할 수 있습니다',
              onFinished: () {
                _startTimer(1000, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('GT');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('248.68');
                  setState(() {
                    pv0 = '248.68';
                  });
                  _startTimer(1000, () {
                    setState(() {
                      fourthani = true;
                    });
                  });
                });
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
