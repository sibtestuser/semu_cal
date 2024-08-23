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

class KClass_5 extends ConsumerStatefulWidget {
  const KClass_5({super.key});

  @override
  ConsumerState<KClass_5> createState() => _KClass_5State();
}

class _KClass_5State extends ConsumerState<KClass_5> {
  bool startani = false;
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  bool fourthani = false;
  bool fifthani = false;
  String x0 = '100';
  String x1 = '';
  String x2 = '';
  String x3 = '';
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
              text: '자산이 100이 있고 3년간 2배씩 증가한다면? ',
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
              text: '먼저 매번 2를 곱해줘야 하니까 2 그리고 x x',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('2');

                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2');
                  _startTimer(500, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('x');
                    _startTimer(500, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('x');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateK(operationEnum.multiply);
                      _startTimer(500, () {
                        setState(() {
                          secondani = true;
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
            MyAnimatedText(
              text: '그리고 초기값 100 을 입력하고 = 을 누르면',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('1');
                  _startTimer(500, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('0');
                    _startTimer(500, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('0');
                      _startTimer(500, () {
                        // ref
                        //     .read(displayControllerProvider.notifier)
                        //     .setTouchButton('=', duration: 500);
                        setState(() {
                          thirdani = true;
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
              text: '위와 같이 결과값이 나옵니다.',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=', duration: 300);
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('200');
                  ref.read(displayControllerProvider.notifier).addGTList(200);
                  _startTimer(300, () {
                    setState(() {
                      x1 = '200';
                    });
                    _startTimer(500, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('=', duration: 300);
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('400');
                      ref
                          .read(displayControllerProvider.notifier)
                          .addGTList(400);

                      setState(() {
                        x2 = '400';
                      });

                      _startTimer(500, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('=', duration: 300);
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('800');
                        ref
                            .read(displayControllerProvider.notifier)
                            .addGTList(800);

                        setState(() {
                          x3 = '800';
                          fourthani = true;
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
          if (fourthani)
            MyAnimatedText(
              text:
                  '결과 800도 구했지만 GT 에 저장된 값들도 x1, x2, x3 년도의 값과 동일한 것을 확인할 수 있습니다.',
              onFinished: () {
                _startTimer(10, () {
                  ref.read(classModelProvider.notifier).setNextPage(true);
                  setState(() {
                    secondani = true;
                  });
                });
              },
            ),
        ],
      ),
    );
  }
}
