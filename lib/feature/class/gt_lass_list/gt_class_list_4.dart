import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_4 extends ConsumerStatefulWidget {
  const GTClass_4({super.key});

  @override
  ConsumerState<GTClass_4> createState() => _GTClass_4State();
}

class _GTClass_4State extends ConsumerState<GTClass_4> {
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
                        '(2 x 3) - (4 x 5) = ?',
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
              text: '먼저 2 x 3 을 계산하고 = 으로 GT 에 저장 ',
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
                          firstani = true;
                        });
                      });
                    });
                  });
                });
              }),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
              text: '그리고 4 x 5 를 계산하고 = 으로 GT 에 저장 ',
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
                        _startTimer(500, () {
                          setState(() {
                            secondani = true;
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
            MyAnimatedText(
              text: 'GT 버튼으로 결과를 확인하면 ',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('GT');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('26');
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
              text: '-14 가 아닌 26이 나옵니다. ',
              onFinished: () {
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
              text: 'GT 는 기본적으로 M기능 중 M+ 기능만 지원합니다',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
