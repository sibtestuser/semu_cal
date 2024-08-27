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
  })  : _displaaycontroller = displaycontroller,
        super(Calmodel());

  final DisplayController _displaaycontroller;

  void numberButtonPressed(String value) {
    if (value == '.') {
      if (state.workingFirstOperand) {
        if (state.firstOperand == '0') {
          state = state.copyWith(
            firstOperand: '0.',
          );
          _displaaycontroller.updateOutput(state.firstOperand);
          return;
        }
        if (state.firstOperand.contains('.')) {
          return;
        }
      } else {
        if (state.secondOperand == '' || state.secondOperand == '0') {
          state = state.copyWith(
            secondOperand: '0.',
          );
          _displaaycontroller.updateOutput(state.secondOperand);
          return;
        }
        if (state.secondOperand.contains('.') ||
            state.secondOperand == '0' ||
            state.secondOperand == '') {
          return;
        }
      }
    }

    if (state.workingFirstOperand) {
      state = state.copyWith(
        firstOperand: state.firstOperand == "0" || state.firstOperand == ' '
            ? value
            : state.firstOperand + value,
      );
      _displaaycontroller.updateOutput(state.firstOperand);
    } else {
      state = state.copyWith(
        secondOperand: state.secondOperand == "0" || state.secondOperand == ''
            ? value
            : state.secondOperand + value,
      );
      _displaaycontroller.updateOutput(state.secondOperand);
    }
  }

  void operationButtonPress(operationEnum value) {
    if (state.operation == value && state.secondOperand == '0' ||
        state.secondOperand == '' && state.k == operationEnum.none) {
      if (state.firstOperand == '0') {
        state = state.copyWith(
          firstOperand: '0',
          workingFirstOperand: false,
        );
      }

      state = state.copyWith(
        k: value,
      );
      _displaaycontroller.updateK(value);
      return;
    }
//기존 k랑 다르다면
    if (state.k != operationEnum.none &&
        value != state.k &&
        value != operationEnum.result) {
      state = state.copyWith(
        k: operationEnum.none,
        currentK: 0,
        firstOperand: _displaaycontroller.state.displyOutput,
        secondOperand: '0',
      );
      _displaaycontroller.updateK(operationEnum.none);
    }

    if (state.firstOperand == '0' &&
        _displaaycontroller.state.displyOutput != '0') {
      state = state.copyWith(
        firstOperand: _displaaycontroller.state.displyOutput,
        workingFirstOperand: false,
      );
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
        state.firstOperand = '0';
        state.workingFirstOperand = true;
        state.secondOperand = '0';
        break;
      case functionEnum.mminus:
        addMemory(value, context);
        state.firstOperand = '0';
        state.workingFirstOperand = true;
        state.secondOperand = '0';
        break;
      case functionEnum.gt:
        // gtButtonPressed();
        break;
      case functionEnum.mr:
        state.firstOperand = '0';
        state.workingFirstOperand = true;
        state.secondOperand = '0';
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
    if (state.workingFirstOperand) {
      if (_displaaycontroller.state.displyOutput != '0') {
        state.firstOperand = _displaaycontroller.state.displyOutput;
      }
      if (type == functionEnum.mplus) {
        state.currentMemory += double.parse(state.firstOperand);
        _displaaycontroller.addMemoryList(
            double.parse(state.firstOperand), context);
      } else if (type == functionEnum.mminus) {
        state.currentMemory -= double.parse(state.firstOperand);
        _displaaycontroller.addMemoryList(
            double.parse(state.firstOperand) * -1, context);
      }
      return;
    }

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
      if (state.k != operationEnum.none) {
        final displaynum = double.parse(_displaaycontroller.state.displyOutput);
        _displaaycontroller.addMemoryList(displaynum, context);
        return;
      }
      state.currentMemory += tempResult;
      _displaaycontroller.addMemoryList(tempResult, context);
      readyNewCalculate();
    } else if (type == functionEnum.mminus) {
      if (state.k != operationEnum.none) {
        final displaynum =
            double.parse(_displaaycontroller.state.displyOutput) * -1;

        _displaaycontroller.addMemoryList(displaynum, context);
        return;
      }
      state.currentMemory -= tempResult;
      _displaaycontroller.addMemoryList(tempResult * -1, context);
      readyNewCalculate();
    }
    _displaaycontroller.updateOutput(tempResult.toString());
  }

  void makeResult() {
    //추후에 여기 gt 에 넣어야지.
    double firstNum = double.parse(state.firstOperand);
    double secondNum = double.parse(state.secondOperand);
    double displayNum = double.parse(_displaaycontroller.state.displyOutput);

    double result = 0;

    if (state.k != operationEnum.none) {
      secondNum = displayNum;
      state = state.copyWith(
        secondOperand: displayNum.toString(),
      );
      switch (state.k) {
        case operationEnum.plus:
          result = firstNum + secondNum;
          state = state.copyWith(
            currentK: result,
          );
          break;
        case operationEnum.minus:
          result = secondNum - firstNum;
          state = state.copyWith(
            currentK: result,
          );
          break;
        case operationEnum.multiply:
          result = displayNum * firstNum;
          state = state.copyWith(
            currentK: result,
          );
          break;
        case operationEnum.divide:
          result = secondNum / firstNum;
          state = state.copyWith(
            currentK: result,
          );
          break;
        default:
          return;
      }
    } else {
      if (state.secondOperand == '0') {
        secondNum = firstNum;
      }
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
          return;
      }
    }

    if (state.k != operationEnum.none) {
      _displaaycontroller.addGTList(result);
      _displaaycontroller.updateOutput(state.currentK.toString());
      state = state.copyWith(
        gt: state.gt + result,
      );
      return;
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
