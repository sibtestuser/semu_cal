import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_1 extends ConsumerStatefulWidget {
  const GTClass_1({super.key});

  @override
  ConsumerState<GTClass_1> createState() => _GTClass_1State();
}

class _GTClass_1State extends ConsumerState<GTClass_1> {
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
              text: '2번째 메모리 공간 GT에 대해 알아보겠습니다',
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
              text: 'Memory는 처음 사용했던 분들도',
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
              text: 'GT 는 자신도 모르게 메모리를 사용하고 있습니다.',
              onFinished: () {
                _startTimer(300, () {
                  setState(() {
                    thirdani = true;
                  });
                  // ref.read(displayControllerProvider.notifier).addMemoryList(20, context);
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (thirdani)
            MyAnimatedText(
              text: '계산의 결과를 보기위해 = 버튼을 누르는 순간',
              onFinished: () {
                setState(() {
                  fourthani = true;
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fourthani)
            MyAnimatedText(
              text: '결과값이 GT에 저장되기 때문입니다.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
