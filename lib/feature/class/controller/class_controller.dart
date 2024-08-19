import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/class_list.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/model/class_model.dart';

final classModelProvider =
    StateNotifierProvider<ClassController, ClassModel>((ref) {
  return ClassController(ref: ref);
});

class ClassController extends StateNotifier<ClassModel> {
  ClassController({
    required Ref ref,
  }) : super(ClassModel());

  void setClassType(ClassEnum classtype) {
    state = state.copyWith(classtype: classtype);
    setClassList(classtype);
  }

  void setTestType(TestEnum testtype) {
    state = state.copyWith(testtype: testtype);
  }

  void setClassList(ClassEnum classtype) {
    switch (classtype) {
      case ClassEnum.memory:
        state = state.copyWith(
          classWidgetList: ClassList.memoryClassList,
        );
        break;

      case ClassEnum.gt:
      // TODO: Handle this case.
      case ClassEnum.k:
      case ClassEnum.none:
        state = state.copyWith(
          classWidgetList: [
            const Text('텅'),
          ],
        );
      // TODO: Handle this case.
    }
  }

  void setNextPage(bool value) {
    state = state.copyWith(goNextPage: value);
  }

  void makeReset() {
    state = ClassModel();
  }
}
