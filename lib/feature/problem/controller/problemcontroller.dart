import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/test/controller/test_controller.dart';
import 'package:semu_cal/model/problem.dart';
import 'package:semu_cal/repository/problem_repository.dart';

final problemControllerProvider =
    StateNotifierProvider<Problemcontroller, Problem>((ref) {
  return Problemcontroller(
      problemRepository: ref.watch(problemRepositoryProvider), ref: ref);
});

class Problemcontroller extends StateNotifier<Problem> {
  ProblemRepository problemRepository;
  Ref ref;
  Problemcontroller({required this.problemRepository, required this.ref})
      : super(Problem());

  void setProblemWidget(Widget problemWidget) {
    state = state.copyWith(problemWidget: problemWidget);
  }

  void makeProblem() {
    final newProblem = problemRepository.makeNewProblem();
    state = Problem();
    state = newProblem;
  }

  void updateChecked(bool isChecked) {
    state = state.copyWith(isChecked: isChecked);
  }

  void checkAnser() {
    double answer = 0;
    List memoryList = ref.read(displayControllerProvider).memory;
    List gtList = ref.read(displayControllerProvider).gt;
    String answerString = ref.read(displayControllerProvider).displyOutput;
    ClassEnum classtype = ref.read(classModelProvider).classtype;
    double displayValue = double.parse(answerString);
    if (classtype == ClassEnum.memory) {
      for (int i = 0; i < memoryList.length; i++) {
        answer += memoryList[i];
      }
    } else if (classtype == ClassEnum.gt) {
      for (int i = 0; i < gtList.length; i++) {
        answer += gtList[i];
      }
    } else {
      answer = displayValue;
    }
    //print('answer: $answer');
    //print('displayValue: $displayValue');
    if (answer == state.numberAnswer && displayValue == answer) {
      state = state.copyWith(isCorrest: true);
      print('정답입니다');
    } else {
      state = state.copyWith(isCorrest: false);
      print('오답입니다');
    }
  }

  void reset() {
    state = Problem();
  }
}
