import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_2 extends ConsumerStatefulWidget {
  const GTClass_2({super.key});

  @override
  ConsumerState<GTClass_2> createState() => _GTClass_2State();
}

class _GTClass_2State extends ConsumerState<GTClass_2> {
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
                        '(2 x 3) + (4 x 5) = ?',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // 글자색을 검은색으로 설정
                      ),
                    )
                  : null,
            ),
          const SizedBox(
            height: 5,
          ),
          MyAnimatedText(
              text: 'GT를 이용하여 위 연산을 계산해보겠습니다.',
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
              text: '2  x  3 그리고 = 을 누르면',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('2');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('2');
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('x');
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('3');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('3');
                      _startTimer(300, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('=');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('6');
                        ref
                            .read(displayControllerProvider.notifier)
                            .addGTList(6);
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
              text: '결과값 6이 GT 에 저장이 되고',
              onFinished: () {
                setState(() {
                  thirdani = true;
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '다음 연산도 4 x 5 그리고 = 을 누르면',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('4');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('4');
                  _startTimer(200, () {
                    ref
                        .read(displayControllerProvider.notifier)
                        .setTouchButton('x');
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('5');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('5');
                      _startTimer(300, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('=');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('20');
                        ref
                            .read(displayControllerProvider.notifier)
                            .addGTList(20);
                        setState(() {
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
              text: 'GT 메모리에 6 과 20이 저장되었습니다.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
