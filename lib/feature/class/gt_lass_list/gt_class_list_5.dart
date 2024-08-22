import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_5 extends ConsumerStatefulWidget {
  const GTClass_5({super.key});

  @override
  ConsumerState<GTClass_5> createState() => _GTClass_5State();
}

class _GTClass_5State extends ConsumerState<GTClass_5> {
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
            text: 'GT 는 Grand Total(총합)의 이름에 맞게',
            onFinished: () {
              _startTimer(10, () {
                ref.read(displayControllerProvider.notifier).makeReset();
                ref.read(displayControllerProvider.notifier).addGTList(6);
                ref.read(displayControllerProvider.notifier).addGTList(20);
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
              text: '= 으로 나온 결과값들의 총합을 의미합니다.',
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
              text: '따라서 일반적인 계산의 경우 GT 보다는 M 의 사용을 권장합니다.',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
