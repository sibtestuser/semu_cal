import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class KClass_3 extends ConsumerStatefulWidget {
  const KClass_3({super.key});

  @override
  ConsumerState<KClass_3> createState() => _KClass_3State();
}

class _KClass_3State extends ConsumerState<KClass_3> {
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
          if (startani)
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
              ), // 배경색을 하얀색으로 설정
              child: startani
                  ? const Center(
                      child: Text(
                        '(초기값) 10 x 3 x 3 x 3',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // 글자색을 검은색으로 설정
                      ),
                    )
                  : null,
            ),
          const SizedBox(
            height: 10,
          ),
          MyAnimatedText(
              text: '1. 반복될 연산 x 3 을 계산기에 먼저 알려줍니다.',
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
            MyAnimatedText(
              text: '입력시에는 한국말 순서로 입력해야 합니다.',
              onFinished: () {
                setState(() {
                  secondani = true;
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            MyAnimatedText(
              text: '\'삼을 곱함\' 이니 숫자 3을 먼저 입력합니다.',
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('3');
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('3');
                _startTimer(400, () {
                  setState(() {
                    thirdani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            MyAnimatedText(
              text: 'x 를 2번눌러 반복할 연산이라는걸 알려줍니다.',
              onFinished: () {
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
              text: '디스플레이에 K 가 표시되며 반복연산이 준비됩니다.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
