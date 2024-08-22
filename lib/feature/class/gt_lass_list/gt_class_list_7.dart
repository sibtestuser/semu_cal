import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_7 extends ConsumerStatefulWidget {
  const GTClass_7({super.key});

  @override
  ConsumerState<GTClass_7> createState() => _GTClass_7State();
}

class _GTClass_7State extends ConsumerState<GTClass_7> {
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
            text: '굳이 GT를 알아야 하나 싶겠지만,',
            onFinished: () {
              _startTimer(10, () {
                ref.read(displayControllerProvider.notifier).makeReset();

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
              text: 'GT는 다음에 알아볼 K와 함께 사용 될 때',
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
              text: '진가를 발휘합니다.',
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
              text: '반복된 계산의 누적치를 구해주거든요',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
