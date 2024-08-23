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

class KClass_10 extends ConsumerStatefulWidget {
  const KClass_10({super.key});

  @override
  ConsumerState<KClass_10> createState() => _KClass_10State();
}

class _KClass_10State extends ConsumerState<KClass_10> {
  bool startani = false;
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  bool fourthani = false;
  bool fifthani = false;
  String x0 = '';
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
              text: '반대로 x1년도 1원의 현재가치는 1/1.12 이고',
              onFinished: () {
                _startTimer(10, () {
                  ref.read(displayControllerProvider.notifier).makeReset();
                  ref.read(displayControllerProvider.notifier).addGTList(0.89);
                  setState(() {
                    x1 = '0.89';
                    firstani = true;
                  });
                });
              }),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
                text: 'x2 년도는 1.12을 두번, x3년도는 1.12를 세번 나눈값입니다.',
                onFinished: () {
                  _startTimer(1000, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .addGTList(0.80);
                    setState(() {
                      x2 = '0.80';
                    });
                    _startTimer(1000, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .addGTList(0.71);
                      setState(() {
                        x3 = '0.71';
                        secondani = true;
                      });
                    });
                  });
                }),
          const SizedBox(
            height: 3,
          ),
          if (secondani)
            MyAnimatedText(
              text: 'GT버튼으로 저장된 현가를 모두 더하면',
              onFinished: () {
                _startTimer(1000, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('GT');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2.40');
                  setState(() {
                    x0 = '2.40';
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
              text: '연금현가계수를 쉽게 구할 수 있습니다.',
              onFinished: () {
                _startTimer(10, () {
                  ref.read(classModelProvider.notifier).setNextPage(true);
                });
              },
            ),
        ],
      ),
    );
  }
}
