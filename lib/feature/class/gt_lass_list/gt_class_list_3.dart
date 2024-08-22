import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/%08widgets/my_ani_text.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class GTClass_3 extends ConsumerStatefulWidget {
  const GTClass_3({super.key});

  @override
  ConsumerState<GTClass_3> createState() => _GTClass_3State();
}

class _GTClass_3State extends ConsumerState<GTClass_3> {
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
              text: 'GT 에 저장된 계산 결과는? ',
              onFinished: () {
                ref.read(displayControllerProvider.notifier).makeReset();
                ref.read(displayControllerProvider.notifier).addGTList(6);
                ref.read(displayControllerProvider.notifier).addGTList(20);
                _startTimer(500, () {
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
              text: 'GT 버튼을 눌러 확인 가능합니다',
              onFinished: () {
                _startTimer(300, () {
                  ref
                      .read(displayControllerProvider.notifier)
                      .setTouchButton('GT');
                  ref
                      .read(displayControllerProvider.notifier)
                      .updateTempOutput('26');
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
              text: '저장 된 +6 + 20 = 26 결과를 확인할 수 있습니다.',
              onFinished: () {
                _startTimer(300, () {
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
              text: '그럼 M 과 차이점은 무엇일까요?',
              onFinished: () {
                ref.read(classModelProvider.notifier).setNextPage(true);
              },
            ),
        ],
      ),
    );
  }
}
