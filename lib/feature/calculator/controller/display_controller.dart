import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/model/display_model.dart';
import 'package:semu_cal/util/utils.dart';

final displayControllerProvider =
    StateNotifierProvider<DisplayController, DisplayModel>((ref) {
  return DisplayController(
    ref: ref,
  );
});

class DisplayController extends StateNotifier<DisplayModel> {
  final Ref _ref;

  DisplayController({
    required Ref ref,
  })  : _ref = ref,
        super(DisplayModel());

  void updateOutput(String value) {
    double parsedValue = double.parse(value);
    String formattedValue = parsedValue.toStringAsFixed(1);
    value = formattedValue;
    state = state.copyWith(
      displyOutput: value,
    );
  }

  void resetOutput() {
    state = state.copyWith(
      displyOutput: '0',
    );
  }

  void addMemoryList(double value, BuildContext context) {
    double roundedValue = double.parse(value.toStringAsFixed(1));
    state = state.copyWith(
      memory: [...state.memory, roundedValue],
    );
    if (state.memory.length > 3) {
      showSnackBar(context, '메모리는 최대 3개만 표시됩니다');
    }
  }

  void addGTList(double value) {
    double roundedValue = double.parse(value.toStringAsFixed(1));
    state = state.copyWith(
      gt: [...state.gt, value],
    );
  }

  void clearMemory() {
    state = state.copyWith(
      memory: [],
    );
  }

  void updateOperation(operationEnum value) {
    state = state.copyWith(
      operation: value,
    );
  }

  void makeReset() {
    state = DisplayModel();
  }

  void updateK(operationEnum value) {
    state = state.copyWith(
      kShow: value,
    );
  }
}
