import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/x_year_widget.dart';
import 'package:semu_cal/model/problem.dart';
import 'package:semu_cal/service/problem_maker.dart';

final KServiceProvider = Provider<KService>((ref) {
  return KService();
});

class ProblemSet {
  int firstValue = 0;
  int howmany = 0;
  double operand = 0;
  String operator = '';
  String x0 = '';
  String x1 = '';
  String x2 = '';
  String x3 = '';
  String pv0 = '';
  String pv1 = '';
  String pv2 = '';
  String pv3 = '';
  String basicProblem = '';
  String advancedProblem = '';
  double result = 0;
}

class KService extends ProblemMaker {
  @override
  String getAnswer() {
    return 'answer';
  }

  @override
  Widget getProblemWidget() {
    // TODO: implement getProblemWidget
    throw UnimplementedError();
  }

  ProblemSet makeMultiProblem() {
    //미래가치
    ProblemSet problem = ProblemSet();
    problem.operator = 'x';
    problem.firstValue = (Random().nextInt(9) + 1) * 10;
    problem.operand = (Random().nextInt(9) + 5) / 10;
    problem.howmany = Random().nextInt(3) + 1;
    if (problem.howmany == 1) {
      problem.howmany = 2;
    }

    String firstValueString = problem.firstValue.toString();
    String operandString = problem.operand.toString();
    String howmanyString = problem.howmany.toString();
    problem.x0 = problem.firstValue.toString();
    if (problem.howmany == 1) {
      problem.result = problem.firstValue * problem.operand;
    } else if (problem.howmany == 2) {
      problem.result = problem.firstValue * problem.operand * problem.operand;
    } else {
      problem.result = problem.firstValue *
          problem.operand *
          problem.operand *
          problem.operand;
    }
    problem.basicProblem =
        ' 초기값 $firstValueString 에 $operandString 를 $howmanyString 번 곱하면?';
    problem.advancedProblem =
        '(이자율 $operandString)  x0년도 가치가 $firstValueString 일때  x$howmanyString 년도 미래가치는?';
    return problem;
  }

  ProblemSet makeDivProblem() {
    //현재가치
    ProblemSet problem = ProblemSet();
    problem.operator = '÷';
    problem.firstValue = (Random().nextInt(9) + 1) * 10;
    problem.operand = (Random().nextInt(9) + 5) / 10;
    problem.howmany = Random().nextInt(3) + 1;
    if (problem.howmany == 1) {
      problem.howmany = 2;
    }

    String firstValueString = problem.firstValue.toString();
    String operandString = problem.operand.toString();
    String howmanyString = problem.howmany.toString();

    if (problem.howmany == 1) {
      problem.result = problem.firstValue * problem.operand;
      problem.x1 = problem.firstValue.toString();
    } else if (problem.howmany == 2) {
      problem.result = problem.firstValue / problem.operand / problem.operand;

      problem.x2 = firstValueString;
    } else {
      problem.result = problem.firstValue /
          problem.operand /
          problem.operand /
          problem.operand;

      problem.x3 = firstValueString;
    }
    problem.basicProblem =
        '초기값 $firstValueString 에 $operandString 을 $howmanyString 번 곱하면?';
    problem.advancedProblem =
        ' (이자율 $operandString)  x$howmanyString년도 가치가 $firstValueString 일때  x0년도 현재가치는?';
    return problem;
  }

  ProblemSet makeDivProblem2() {
    //현재가치 이자들의 현재가치
    ProblemSet problem = ProblemSet();
    problem.operator = '÷';
    problem.firstValue = (Random().nextInt(9) + 1) * 10;
    problem.operand = (Random().nextInt(9) + 5) / 10;
    problem.howmany = 3;
    problem.x1 = problem.firstValue.toString();
    problem.x2 = problem.firstValue.toString();
    problem.x3 = problem.firstValue.toString();
    String firstValueString = problem.firstValue.toString();
    String operandString = problem.operand.toString();
    String howmanyString = problem.howmany.toString();
    // if (problem.howmany == 1) {
    //   problem.result = problem.firstValue * problem.operand;
    //   problem.x1 = problem.firstValue.toString();
    // } else if (problem.howmany == 2) {
    //   problem.result = problem.firstValue / problem.operand / problem.operand;

    //   problem.x2 =
    //       (problem.firstValue / problem.operand / problem.operand).toString();
    // } else {
    //   problem.result = problem.firstValue /
    //       problem.operand /
    //       problem.operand /
    //       problem.operand;

    //   problem.x3 = (problem.firstValue /
    //           problem.operand /
    //           problem.operand /
    //           problem.operand)
    //       .toString();
    // }
    problem.result = (problem.firstValue / problem.operand) +
        (problem.firstValue / (problem.operand * problem.operand)) +
        (problem.firstValue /
            (problem.operand * problem.operand * problem.operand));
    problem.basicProblem =
        '초기값 $firstValueString 에 $operandString 을 $howmanyString 번 곱하면?';
    problem.advancedProblem =
        ' (이자율 $operandString)  3개년도 이자가 각 $firstValueString 일때 이자들의 x0년도 현재가치는?';
    return problem;
  }

  ProblemSet makeBasicRandomProblem() {
    Random random = Random();
    int choice = random.nextInt(3);
    if (choice == 0) {
      return makeMultiProblem();
    } else {
      return makeDivProblem();
    }
  }

  ProblemSet makeAdvancedRandomProblem() {
    Random random = Random();
    int choice = random.nextInt(3);
    if (choice == 0) {
      return makeMultiProblem();
    } else if (choice == 1) {
      return makeDivProblem();
    } else {
      return makeDivProblem2();
    }
  }

  @override
  Problem makeAdvancedProblem() {
    // TODO: implement makeAdvancedProblem
    Problem problem = Problem();
    ProblemSet problemSet = makeAdvancedRandomProblem();
    problem.problem = problemSet.advancedProblem;
    problem.problemWidget = X3YearWidget(
      x0: problemSet.x0,
      x1: problemSet.x1,
      x2: problemSet.x2,
      x3: problemSet.x3,
    );
    problem.numberAnswer = problemSet.result;
    return problem;
  }

  @override
  Problem makeBasicProblem() {
    // TODO: implement makeBasicProblem
    Problem problem = Problem();
    ProblemSet problemSet = makeBasicRandomProblem();
    problem.problem = problemSet.basicProblem;
    problem.numberAnswer = problemSet.result;

    return problem;
  }
}
