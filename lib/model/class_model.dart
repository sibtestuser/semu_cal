// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:semu_cal/core/enum/enum.dart';

class ClassModel {
  ClassEnum classtype = ClassEnum.none;
  TestEnum testtype = TestEnum.none;
  List<Widget> classWidgetList = [];
  bool goNextPage = false;
  ClassModel({
    this.classtype = ClassEnum.none,
    this.classWidgetList = const [],
    this.goNextPage = false,
    this.testtype = TestEnum.none,
  });

  ClassModel copyWith({
    ClassEnum? classtype,
    List<Widget>? classWidgetList,
    bool? goNextPage,
    TestEnum? testtype,
  }) {
    return ClassModel(
      classtype: classtype ?? this.classtype,
      classWidgetList: classWidgetList ?? this.classWidgetList,
      goNextPage: goNextPage ?? this.goNextPage,
      testtype: testtype ?? this.testtype,
    );
  }
}
