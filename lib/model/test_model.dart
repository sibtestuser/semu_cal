import 'package:semu_cal/core/enum/enum.dart';

class TestModel {
  TestEnum testtype = TestEnum.none;

  bool goNextPage = false;
  TestModel({
    this.goNextPage = false,
    this.testtype = TestEnum.none,
  });

  TestModel copyWith({
    ClassEnum? classtype,
    bool? goNextPage,
    TestEnum? testtype,
  }) {
    return TestModel(
      goNextPage: goNextPage ?? this.goNextPage,
      testtype: testtype ?? this.testtype,
    );
  }
}
