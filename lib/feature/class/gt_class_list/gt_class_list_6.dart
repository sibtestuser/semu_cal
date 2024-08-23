import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_6 extends ConsumerStatefulWidget {
  const GTClass_6({super.key});

  @override
  ConsumerState<GTClass_6> createState() => _GTClass_6State();
}

class _GTClass_6State extends ConsumerState<GTClass_6> {
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
                        '(2 - 3) + (4 - 6) = ?',
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
              text: '물론 각 계산의 결과값이 - 라면 GT에도 마이너스로 저장됩니다.',
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
              text: '2 - 3 = 누르면 결과값인 -1이 저장',
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
                        .setTouchButton('-');
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
                            .updateTempOutput('-1');
                        ref
                            .read(displayControllerProvider.notifier)
                            .addGTList(-1);
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
              text: '다음  4 - 6 = 을 누르면 결과값 -2 가 저장',
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
                        .setTouchButton('-');
                    _startTimer(200, () {
                      ref
                          .read(displayControllerProvider.notifier)
                          .setTouchButton('6');
                      ref
                          .read(displayControllerProvider.notifier)
                          .updateTempOutput('6');
                      _startTimer(300, () {
                        ref
                            .read(displayControllerProvider.notifier)
                            .setTouchButton('=');
                        ref
                            .read(displayControllerProvider.notifier)
                            .updateTempOutput('-2');
                        ref
                            .read(displayControllerProvider.notifier)
                            .addGTList(-2);
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
              text: '하지만 이 경우도 GT 로 원하는 결과를 얻기 위해선 좌항과 우항이 + 로 연결되어있어야 하죠.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
