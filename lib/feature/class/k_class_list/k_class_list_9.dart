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

class KClass_9 extends ConsumerStatefulWidget {
  const KClass_9({super.key});

  @override
  ConsumerState<KClass_9> createState() => _KClass_9State();
}

class _KClass_9State extends ConsumerState<KClass_9> {
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
          X3YearWidget(x0: '1', x1: x1, x2: x2, x3: x3),
          const SizedBox(
            height: 10,
          ),
          MyAnimatedText(
              text: '현가와 연금현가에 대해 알아보겠습니다 (이자율 12%)',
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
                text: 'x0 년도 1원은 x1년도에 가치가 1.12원이 됩니다.',
                onFinished: () {
                  setState(() {
                    x1 = '1.12';
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
                  text: 'x2년도에는 1.12 * 1.12 = 1.25원이 됩니다',
                  onFinished: () {
                    setState(() {
                      x2 = '1.25';
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
              text: 'x3 년도에는 1.12 를 3번 곱한 1.40원이 됩니다.',
              onFinished: () {
                setState(() {
                  fourthani = true;
                  x3 = '1.40';
                });
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
