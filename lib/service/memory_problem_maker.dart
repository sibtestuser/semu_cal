import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/model/problem.dart';
import 'package:semu_cal/service/problem_maker.dart';

final MemoryServiceProvider = Provider<MemoryService>((ref) {
  return MemoryService();
});

class ProblemSet {
  double firstOP = 0;
  double secondOP = 0;
  String operator = '';
  String firstOPString = '';
  String secondOPString = '';
  String setadvanceString = '';
  String setbasicString = '';
  bool isPlus = true;
  double setResult = 0;
}

class MemoryService extends ProblemMaker {
  List<ProblemSet> problemSet = [];

  @override
  String getAnswer() {
    //for loop 로 problem set 결과 더한값을 보내주자

    return 'answer';
  }

  ProblemSet plusProblemSet() {
    Random random = Random();
    int choice = random.nextInt(2);
    ProblemSet problem = ProblemSet();

    problem.secondOP = Random().nextInt(12).toDouble() + 1;
    problem.firstOP = problem.secondOP * (Random().nextInt(10).toDouble() + 1);
    if (choice == 0) {
      problem.operator = 'x';
      problem.setResult = problem.firstOP * problem.secondOP;
      problem.setadvanceString = makeRandomString(
          problem.firstOP, problem.secondOP, problem.operator, true);
      problem.setbasicString = makeRandomNumber(
          problem.firstOP, problem.secondOP, problem.operator, true);
    } else {
      problem.operator = '÷';
      problem.setResult = problem.firstOP / problem.secondOP;
      problem.setadvanceString = makeRandomString(
          problem.firstOP, problem.secondOP, problem.operator, true);
      problem.setbasicString = makeRandomNumber(
          problem.firstOP, problem.secondOP, problem.operator, true);
    }

    return problem;
  }

  ProblemSet minusProblemSet() {
    Random random = Random();
    int choice = random.nextInt(2);
    ProblemSet problem = ProblemSet();
    // problem.firstOP = Random().nextInt(100).toDouble();
    problem.secondOP = Random().nextInt(12).toDouble() + 1;
    problem.firstOP = problem.secondOP * (Random().nextInt(10).toDouble() + 1);
    if (choice == 0) {
      problem.operator = 'x';
      problem.setResult = problem.firstOP * problem.secondOP * -1;
      problem.setadvanceString = makeRandomString(
          problem.firstOP, problem.secondOP, problem.operator, false);
      problem.setbasicString = makeRandomNumber(
          problem.firstOP, problem.secondOP, problem.operator, false);
    } else {
      problem.operator = '÷';
      problem.setResult = problem.firstOP / problem.secondOP * -1;
      problem.setadvanceString = makeRandomString(
          problem.firstOP, problem.secondOP, problem.operator, false);
      problem.setbasicString = makeRandomNumber(
          problem.firstOP, problem.secondOP, problem.operator, false);
    }

    return problem;
//setReault 는 결과값에 -1 곱해주기
  }

  @override
  Widget getProblemWidget() {
    // TODO: implement getProblemWidget
    throw UnimplementedError();
  }

  String makeRandomString(
      double firstOP, double secondOP, String operator, bool isPlus) {
    int firstopInt = firstOP.toInt();
    int secondopint = secondOP.toInt();
    Random random = Random();
    int choice = random.nextInt(2);
    if (operator == 'x') {
      if (isPlus) {
        String temp = " ( 수익 $firstopInt 원이 $secondopint 개월간 발생 시 총 수익 ) ";
        return temp;
      } else {
        String temp = " ( 비용 $firstopInt 원이 $secondopint 개월간 발생 시 총 비용 ) ";
        return temp;
      }
    } else {
      if (isPlus) {
        String temp = " ( $secondopint 개월 총 매출 $firstopInt 원 중 1달치 수령액 ) ";
        return temp;
      } else {
        String temp = " ( $secondopint 개월 총 비용 $firstopInt 원 중 1달치 지출액 ) ";
        return temp;
      }
    }
  }

  String makeRandomNumber(
      double firstOP, double secondOP, String operator, bool isPlus) {
    Random random = Random();
    int firstopInt = firstOP.toInt();
    int secondopint = secondOP.toInt();
    int choice = random.nextInt(2);
    if (operator == 'x') {
      if (isPlus) {
        String temp = "+ ( $firstopInt  x  $secondopint  ) ";
        return temp;
      } else {
        String temp = " - ( $firstopInt  x  $secondopint  ) ";
        return temp;
      }
    } else {
      if (isPlus) {
        String temp = "+ ( $firstopInt ÷ $secondopint ) ";
        return temp;
      } else {
        String temp = " - ( $firstopInt ÷ $secondopint ) ";
        return temp;
      }
    }
  }

  ProblemSet plusPlusProblemSet() {
    return plusPlusProblemSet();
  }

  ProblemSet randomProbleSet() {
    Random random = Random();
    int choice = random.nextInt(2);
    if (choice == 0) {
      return plusProblemSet();
    } else {
      return minusProblemSet();
    }
  }

  @override
  Problem makeAdvancedProblem() {
    problemSet = [];
    Random random = Random();
    int choice = random.nextInt(2);
    if (choice == 0) {
      // 2개의 프라불럼 셋
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
    } else {
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
    }

    Problem problem = Problem();
    String temp = '';
    double answer = 0;
    for (int i = 0; i < problemSet.length; i++) {
      temp = temp + problemSet[i].setadvanceString + '\n';
      answer = answer + problemSet[i].setResult;
    }
    problem.problem = temp;
    problem.numberAnswer = answer;

    //0이면 2개의 프라블럼셋 1이면 3개의 프라플럼셋
    // TODO: implement makeAdvancedProblem
    return problem;
  }

  @override
  Problem makeBasicProblem() {
    problemSet = [];
    Random random = Random();
    int choice = random.nextInt(2);
    if (choice == 0) {
      // 2개의 프라불럼 셋
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
    } else {
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
      problemSet.add(randomProbleSet());
    }
    Problem problem = Problem();
    String temp = '';
    double answer = 0;
    for (int i = 0; i < problemSet.length; i++) {
      temp = temp + problemSet[i].setbasicString + '\n';

      answer = answer + problemSet[i].setResult;
    }
    problem.problem = temp;
    problem.numberAnswer = answer;

    // TODO: implement makeBasicProblem
    return problem;
  }

  Problem makeGTbasicProblem() {
    problemSet = [];
    Random random = Random();
    int choice = random.nextInt(2);
    if (choice == 0) {
      // 2개의 프라불럼 셋
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
    } else {
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
    }
    Problem problem = Problem();
    String temp = '';
    double answer = 0;
    for (int i = 0; i < problemSet.length; i++) {
      temp = temp + problemSet[i].setbasicString + '\n';

      answer = answer + problemSet[i].setResult;
    }
    problem.problem = temp;
    problem.numberAnswer = answer;
    return problem;
  }

  Problem makeGTAdvancedProblem() {
    problemSet = [];
    Random random = Random();
    int choice = random.nextInt(2);
    if (choice == 0) {
      // 2개의 프라불럼 셋
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
    } else {
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
      problemSet.add(plusProblemSet());
    }

    Problem problem = Problem();
    String temp = '';
    double answer = 0;
    for (int i = 0; i < problemSet.length; i++) {
      temp = temp + problemSet[i].setadvanceString + '\n';
      answer = answer + problemSet[i].setResult;
    }
    problem.problem = temp;
    problem.numberAnswer = answer;

    //0이면 2개의 프라블럼셋 1이면 3개의 프라플럼셋
    // TODO: implement makeAdvancedProblem
    return problem;
  }
}
