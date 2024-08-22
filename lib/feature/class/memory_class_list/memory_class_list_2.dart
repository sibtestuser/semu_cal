import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';

class MemoryClass_2 extends ConsumerStatefulWidget {
  const MemoryClass_2({super.key});

  @override
  ConsumerState<MemoryClass_2> createState() => _MemoryClass_2State();
}

class _MemoryClass_2State extends ConsumerState<MemoryClass_2> {
  bool firstani = false;
  bool secondani = false;
  bool thirdani = false;
  final List<Timer> _timers = [];
  @override
  void dispose() {
    for (var timer in _timers) {
      timer.cancel();
    }

    super.dispose();
  }

  void _startTimer(Duration duration, VoidCallback callback) {
    _timers.add(Timer(duration, () {
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
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('만약 메모리 기능 없이 아래의 계산을 한다면? '),
            ],
            pause: const Duration(milliseconds: 100),
            isRepeatingAnimation: false,
            onFinished: () {
              setState(() {
                firstani = true;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: firstani ? 30 : 0,

            decoration: BoxDecoration(
              color: Colors.white, // 배경색을 하얀색으로 설정
              boxShadow: firstani
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
            child: firstani
                ? const Center(
                    child: Text(
                      '(2x3) + (4x5)',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black), // 글자색을 검은색으로 설정
                    ),
                  )
                : null,
          ),
          if (firstani)
            Row(
              children: [
                Expanded(
                  flex: 7, // Column의 비율을 8로 설정
                  child: Column(
                    children: [
                      if (firstani)
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('2x3 = 6 을 노트에 적고'),
                          ],
                          pause: const Duration(milliseconds: 100),
                          isRepeatingAnimation: false,
                          //  totalRepeatCount: 1,
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
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('4x5 = 20 을 노트에 적은 후'),
                          ],
                          pause: const Duration(milliseconds: 100),
                          isRepeatingAnimation: false,
                          //  totalRepeatCount: 1,
                          onFinished: () {
                            setState(() {
                              thirdani = true;
                            });
                          },
                        ),
                      const SizedBox(height: 5),
                      if (thirdani)
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('6과 20을 다시 더해줍니다'),
                          ],
                          pause: const Duration(milliseconds: 100),
                          isRepeatingAnimation: false,
                          //  totalRepeatCount: 1,
                          onFinished: () {
                            if (!mounted) return;
                            setState(() {
                              thirdani = true;
                            });
                            ref
                                .read(classModelProvider.notifier)
                                .setNextPage(true);
                          },
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3, // Container의 비율을 2로 설정
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5), // 외부 여백
                    decoration: BoxDecoration(
                      color: Colors.yellow[100], // 노트 배경색
                      border: Border.all(
                          color: Colors.brown, width: 2), // 테두리 색상 및 두께
                      borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // 그림자의 위치 조정
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8), // 내부 여백
                    child: Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Column을 중간에 위치
                        children: [
                          if (firstani)
                            Text(
                              '+ 6',
                              style: CustomTextTheme.getClassTextBlack(context),
                            ),
                          if (secondani)
                            Text(
                              '+ 20',
                              style: CustomTextTheme.getClassTextBlack(context),
                            ),
                          if (thirdani) ...[
                            const Divider(),
                            Text(
                              '= 26',
                              style: CustomTextTheme.getClassTextBlack(context)
                                  .copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
