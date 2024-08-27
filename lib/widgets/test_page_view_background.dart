import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/problem/controller/problemcontroller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestPageViewBackground extends ConsumerWidget {
  const TestPageViewBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problemController = ref.watch(problemControllerProvider.notifier);
    //classModel.goNextPage = true;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green[200],
                        shadowColor: Colors.black,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // 정답 보기로
                        problemController.checkAnser();
                        problemController.updateChecked(true);
                      },
                      child: const Text(
                        "정답확인",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[200],
                        shadowColor: Colors.black,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        problemController.reset();
                        ref
                            .read(calculatorControllerProvider.notifier)
                            .makeReset();
                        ref
                            .read(displayControllerProvider.notifier)
                            .makeReset();
                        problemController.makeProblem();
                        // 다음 문제 만들기 실행
                      },
                      child: const Text(
                        "다음문제",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
