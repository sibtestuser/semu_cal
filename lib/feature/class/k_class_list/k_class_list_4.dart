import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class KClass_4 extends ConsumerStatefulWidget {
  const KClass_4({super.key});

  @override
  ConsumerState<KClass_4> createState() => _KClass_4State();
}

class _KClass_4State extends ConsumerState<KClass_4> {
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
              text: '2. 반복될 연산의 초기값 10을 넣어주고',
              onFinished: () {
                _startTimer(200, () {
                  ref.read(displayControllerProvider.notifier).makeReset();

                  ref
                      .read(displayControllerProvider.notifier)
                      .updateK(operationEnum.multiply);
                  _startTimer(300, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('1');
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('0');
                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('10');
                  });
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
              text: '= 을 누르면 첫번째 반복연산 결과 30 이 나옵니다.',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('30');
                  ref.read(displayControllerProvider.notifier).addGTList(30);
                  setState(() {
                    secondani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (secondani)
            MyAnimatedText(
              text: '또 한번 = 을 누르면 30 x 3 = 90',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('=');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('90');
                  ref.read(displayControllerProvider.notifier).addGTList(90);
                  _startTimer(300, () {
                    setState(() {
                      thirdani = true;
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
              text: '다시 = 을 누르면 90 x 3 = 270',
              onFinished: () {
                ref
                    .read(displayControllerProvider.notifier)
                    .setTouchButton('=');
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('270');
                ref.read(displayControllerProvider.notifier).addGTList(270);
                _startTimer(300, () {
                  setState(() {
                    fourthani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fourthani)
            MyAnimatedText(
              text: ' = 을 누를 때마다 GT 저장된 값들도 있네요. 나중에 이 값들도 이용해 볼게요',
              onFinished: () {
                _startTimer(100, () {
                  ref.read(classModelProvider.notifier).setNextPage(true);
                });
              },
            ),
        ],
      ),
    );
  }
}
