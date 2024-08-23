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

class KClass_11 extends ConsumerStatefulWidget {
  const KClass_11({super.key});

  @override
  ConsumerState<KClass_11> createState() => _KClass_11State();
}

class _KClass_11State extends ConsumerState<KClass_11> {
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
          MyAnimatedText(
              text: '지금까지 K 기능에 대해 알아봤습니다.',
              onFinished: () {
                setState(() {
                  firstani = true;
                });
              }),
          const SizedBox(
            height: 3,
          ),
          if (firstani)
            MyAnimatedText(
              text: '사실 K 반복연산은 최초값이 아닌 적용값을 갖습니다.',
              onFinished: () {
                setState(() {
                  secondani = true;
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (secondani)
            MyAnimatedText(
              text:
                  'k 반복연산 표시만 있다면 언제든지 디스플레이에 새로운 값을 입력하면 그 값을 대상으로 반복 연산을 합니다.',
              onFinished: () {
                setState(() {
                  thirdani = true;
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '그리고 이를 이용하면 더 빠른 계산도 가능하지만',
              onFinished: () {
                setState(() {
                  fourthani = true;
                });
              },
            ),
          const SizedBox(
            height: 3,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '우리가 알아본 내용만 알아도 부족하진 않습니다.',
              onFinished: () {
                setState(() {
                  fourthani = true;
                });
              },
            ),
          if (fourthani)
            MyAnimatedText(
              text: '다음은 문제를 풀며 K 기능에 익훅해지는 시간을 가져봅시다.',
              onFinished: () {
                setState(() {
                  fifthani = true;
                });
              },
            ),
        ],
      ),
    );
  }
}
