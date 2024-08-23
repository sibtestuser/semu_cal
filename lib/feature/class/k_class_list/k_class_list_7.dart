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

class KClass_7 extends ConsumerStatefulWidget {
  const KClass_7({super.key});

  @override
  ConsumerState<KClass_7> createState() => _KClass_7State();
}

class _KClass_7State extends ConsumerState<KClass_7> {
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
          X3YearWidget(x0: x0, x1: '100', x2: '100', x3: '100'),
          const SizedBox(
            height: 10,
          ),
          MyAnimatedText(
              text: '3년간 발생한 사채이자의 현재가치는? ',
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
                text: '이자율 10% 기준 x1년도는 100 을 1.1 로 한번 ',
                onFinished: () {
                  setState(() {
                    secondani = true;
                  });
                }),
          const SizedBox(
            height: 3,
          ),
          if (secondani)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyAnimatedText(
                  text: 'x2 년도는 2번   x3 년도는 3번 나누게 됩니다.',
                  onFinished: () {
                    setState(() {
                      thirdani = true;
                    });
                  },
                ),
              ],
            ),
          const SizedBox(
            height: 3,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '그리고 x1 ~ x3 년도의 현재가치를 모두 더하면',
              onFinished: () {
                setState(() {
                  fourthani = true;
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (fourthani)
            MyAnimatedText(
              text: 'GT 메모리에 저장된 결과와 동일합니다.',
              onFinished: () {
                setState(() {
                  fifthani = true;
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (fifthani)
            MyAnimatedText(
              text: '다음장에서 실제로 계산해보겠습니다.',
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
