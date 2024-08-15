import 'dart:convert';

import 'package:semu_cal/core/enum/enum.dart';

class Calmodel {
  String firstOperand = '0';
  String secondOperand = '0';
  operationEnum operation = operationEnum.none;
  functionEnum function = functionEnum.none;
  operationEnum k = operationEnum.none;
  bool workingFirstOperand = true;
  double currentMemory = 0;
  double gt = 0;
  double answerNum = 0;
  double userAnswerNum = 0;
  String userAnswerString = '';
  String answerStirng = '';
  int numOfOperation = 0;
  Calmodel({
    this.firstOperand = '0',
    this.secondOperand = '0',
    this.operation = operationEnum.none,
    this.function = functionEnum.none,
    this.k = operationEnum.none,
    this.workingFirstOperand = true,
    this.currentMemory = 0,
    this.gt = 0,
    this.answerNum = 0,
    this.userAnswerNum = 0,
    this.userAnswerString = '',
    this.answerStirng = '',
    this.numOfOperation = 0,
  });

  Calmodel copyWith({
    String? firstOperand,
    String? secondOperand,
    operationEnum? operation,
    functionEnum? function,
    operationEnum? k,
    bool? workingFirstOperand,
    double? currentMemory,
    double? gt,
    double? answerNum,
    double? userAnswerNum,
    String? userAnswerString,
    String? answerStirng,
    int? numOfOperation,
  }) {
    return Calmodel(
      firstOperand: firstOperand ?? this.firstOperand,
      secondOperand: secondOperand ?? this.secondOperand,
      operation: operation ?? this.operation,
      function: function ?? this.function,
      k: k ?? this.k,
      workingFirstOperand: workingFirstOperand ?? this.workingFirstOperand,
      currentMemory: currentMemory ?? this.currentMemory,
      gt: gt ?? this.gt,
      answerNum: answerNum ?? this.answerNum,
      userAnswerNum: userAnswerNum ?? this.userAnswerNum,
      userAnswerString: userAnswerString ?? this.userAnswerString,
      answerStirng: answerStirng ?? this.answerStirng,
      numOfOperation: numOfOperation ?? this.numOfOperation,
    );
  }
}
