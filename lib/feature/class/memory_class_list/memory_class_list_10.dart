import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_10 extends ConsumerStatefulWidget {
  const MemoryClass_10({super.key});

  @override
  ConsumerState<MemoryClass_10> createState() => _MemoryClass_10State();
}

class _MemoryClass_10State extends ConsumerState<MemoryClass_10> {
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
              text: '지금까지 Memory 에 대해 알아보았습니다.',
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
              text: '= 대신 M+ 와 M- 를 이용하는 부분이',
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
              text: '생소할 수 있습니다만',
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
              text: '기본문제와 응용문제를 통해 ',
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
              text: '금방 익숙해지실거라 생각합니다',
              onFinished: () {
                _startTimer(200, () {
                  setState(() {
                    fifthani = true;
                  });
                });
              },
            ),
          const SizedBox(
            height: 5,
          ),
          if (fifthani)
            MyAnimatedText(
              text: '감사합니다',
              onFinished: () {},
            ),
        ],
      ),
    );
  }
}
