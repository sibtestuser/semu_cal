import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/problem/controller/problemcontroller.dart';
import 'package:semu_cal/model/test_model.dart';
import 'package:semu_cal/repository/problem_repository.dart';

final testModelProvider =
    StateNotifierProvider<TestController, TestModel>((ref) {
  return TestController(
    ref: ref,
  );
});

class TestController extends StateNotifier<TestModel> {
  TestController({
    required Ref ref,
  }) : super(TestModel());

  void setTestType(TestEnum testtype) {
    state = state.copyWith(testtype: testtype);
  }

  void setNextPage(bool value) {
    state = state.copyWith(goNextPage: value);
  }

  void makeReset() {
    state = TestModel();
  }

  TestModel get getTestModel => state;
}
