import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/model/calmodel.dart';

final calculatorControllerProvider =
    StateNotifierProvider<CalculateController, Calmodel>((ref) {
  return CalculateController(
      ref: ref,
      displaycontroller: ref.watch(displayControllerProvider.notifier));
});

class CalculateController extends StateNotifier<Calmodel> {
  CalculateController({
    required Ref ref,
    required DisplayController displaycontroller,
  })  : _ref = ref,
        _displaaycontroller = displaycontroller,
        super(Calmodel());
  final Ref _ref;
  final DisplayController _displaaycontroller;
  void numberButtonPressed(String value) {
    if (state.workingFirstOperand) {
      state = state.copyWith(
        firstOperand:
            state.firstOperand == "0" ? value : state.firstOperand + value,
      );
      _displaaycontroller.updateOutput(state.firstOperand);
    } else {
      state = state.copyWith(
        secondOperand:
            state.secondOperand == "0" ? value : state.secondOperand + value,
      );
      _displaaycontroller.updateOutput(state.secondOperand);
    }
  }

  void operationButtonPress(operationEnum value) {
    if (state.operation == value &&
        state.secondOperand == '0' &&
        state.k == operationEnum.none) {
      state = state.copyWith(
        k: value,
      );
      _displaaycontroller.updateK(value);
      return;
    }

    if (state.k != operationEnum.none && state.secondOperand == '0') {
      state = state.copyWith(
        k: operationEnum.none,
      );
      _displaaycontroller.updateK(operationEnum.none);
    }

    switch (value) {
      case operationEnum.plus:
        state = state.copyWith(
          operation: operationEnum.plus,
          workingFirstOperand: false,
        );
        _displaaycontroller.updateOperation(operationEnum.plus);
        break;
      case operationEnum.minus:
        state = state.copyWith(
          operation: operationEnum.minus,
          workingFirstOperand: false,
        );
        _displaaycontroller.updateOperation(operationEnum.minus);
        break;
      case operationEnum.multiply:
        state = state.copyWith(
          operation: operationEnum.multiply,
          workingFirstOperand: false,
        );
        _displaaycontroller.updateOperation(operationEnum.multiply);
        break;
      case operationEnum.divide:
        state = state.copyWith(
          operation: operationEnum.divide,
          workingFirstOperand: false,
        );
        _displaaycontroller.updateOperation(operationEnum.divide);
        break;
      case operationEnum.result:
        makeResult();

        break;
      default:
        break;
    }
  }

  void functionButtonPressed(functionEnum value, BuildContext context) {
    switch (value) {
      case functionEnum.mplus:
        addMemory(value, context);
        break;
      case functionEnum.mminus:
        addMemory(value, context);
        break;
      case functionEnum.gt:
        // gtButtonPressed();
        break;
      case functionEnum.mr:
        // mrButtonPressed();
        break;
      case functionEnum.k:
        // kButtonPressed();
        break;
      case functionEnum.ac:
        makeReset();
        break;
      default:
        break;
    }
  }

  void addMemory(functionEnum type, BuildContext context) {
    if (state.workingFirstOperand) return;

    if (state.secondOperand == '0') {
      state.secondOperand = state.firstOperand;
    }
    double tempResult = 0;
    switch (state.operation) {
      case operationEnum.plus:
        tempResult = double.parse(state.firstOperand) +
            double.parse(state.secondOperand);
        break;
      case operationEnum.minus:
        tempResult = double.parse(state.firstOperand) -
            double.parse(state.secondOperand);
        break;
      case operationEnum.multiply:
        tempResult = double.parse(state.firstOperand) *
            double.parse(state.secondOperand);
        break;
      case operationEnum.divide:
        tempResult = double.parse(state.firstOperand) /
            double.parse(state.secondOperand);
        break;
      default:
        break;
    }

    if (type == functionEnum.mplus) {
      state.currentMemory += tempResult;
      _displaaycontroller.addMemoryList(tempResult, context);
      readyNewCalculate();
    } else if (type == functionEnum.mminus) {
      state.currentMemory -= tempResult;
      _displaaycontroller.addMemoryList(tempResult * -1, context);
      readyNewCalculate();
    }
  }

  void makeResult() {
    //추후에 여기 gt 에 넣어야지.
    double firstNum = double.parse(state.firstOperand);
    double secondNum = double.parse(state.secondOperand);
    double result = 0;
    switch (state.operation) {
      case operationEnum.plus:
        result = firstNum + secondNum;
        break;
      case operationEnum.minus:
        result = firstNum - secondNum;
        break;
      case operationEnum.multiply:
        result = firstNum * secondNum;
        break;
      case operationEnum.divide:
        result = firstNum / secondNum;
        break;
      default:
        break;
    }
    readyNewCalculate();
    state = state.copyWith(
      gt: state.gt + result,
    );
    _displaaycontroller.addGTList(result);
    _displaaycontroller.updateOutput(result.toString());
  }

  void makeMRResult() {
    _displaaycontroller.updateOutput(state.currentMemory.toString());
  }

  void makeGTResult() {
    _displaaycontroller.updateOutput(state.gt.toString());
  }

  void makeReset() {
    state = Calmodel();
    _displaaycontroller.makeReset();
  }

  void readyNewCalculate() {
    state = state.copyWith(
        firstOperand: '0',
        secondOperand: '0',
        workingFirstOperand: true,
        operation: operationEnum.none);
    _displaaycontroller.updateOperation(operationEnum.none);
  }
}
