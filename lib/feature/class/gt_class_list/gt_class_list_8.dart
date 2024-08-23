import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_8 extends ConsumerStatefulWidget {
  const GTClass_8({super.key});

  @override
  ConsumerState<GTClass_8> createState() => _GTClass_8State();
}

class _GTClass_8State extends ConsumerState<GTClass_8> {
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
          MyAnimatedText(
            text: 'M 에 경우 MC 버튼으로 메모리를 지운다면 ',
            onFinished: () {
              _startTimer(10, () {
                ref.read(displayControllerProvider.notifier).makeReset();
                ref.read(displayControllerProvider.notifier).addGTList(6);
                ref.read(displayControllerProvider.notifier).addGTList(20);
                ref
                    .read(displayControllerProvider.notifier)
                    .updateTempOutput('26');
                setState(() {
                  firstani = true;
                });
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          if (firstani)
            MyAnimatedText(
              text: 'GT 의 경우엔 AC 버튼으로 메모리를 지웁니다.',
              onFinished: () {
                _startTimer(500, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('AC', duration: 3000);
                  _startTimer(300, () {
                    ref.read(displayControllerProvider.notifier).clearGT();
                    ref
                        .read(displayControllerProvider.notifier)
                        .updateTempOutput('0');
                    _startTimer(300, () {
                      setState(() {
                        secondani = true;
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
              text: 'C 버튼의 경우 디스플레이에 있는 값만을 지우고',
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
              text: 'AC 는 메모리의 저장된 값을 함께 지우는 차이점이 있습니다.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
