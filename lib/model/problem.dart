import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Problem {
  Widget? problemWidget;
  String problem = '';
  List<String> userAnswer = [];
  List<String> answer = [];
  double numberAnswer = 0;
  double userNumberAnswer = 0;
  bool isChecked = false;
  bool isCorrest = false;
  bool isMRTouched = false;
  bool isGTTouched = false;
  String x0 = '';
  String x1 = '';
  String x2 = '';
  String x3 = '';
  String pv0 = '';
  String pv1 = '';
  String pv2 = '';
  String pv3 = '';

  Problem({
    this.problemWidget,
    this.problem = '',
    this.userAnswer = const [],
    this.answer = const [],
    this.numberAnswer = 0,
    this.userNumberAnswer = 0,
    this.isChecked = false,
    this.isCorrest = false,
    bool isMRTouched = false,
    bool isGTTouched = false,
    this.x0 = '',
    this.x1 = '',
    this.x2 = '',
    this.x3 = '',
    this.pv0 = '',
    this.pv1 = '',
    this.pv2 = '',
    this.pv3 = '',
  });

  Problem copyWith({
    Widget? problemWidget,
    String? problem,
    List<String>? userAnswer,
    List<String>? answer,
    double? numberAnswer,
    double? userNumberAnswer,
    bool? isChecked,
    bool? isMRTouched,
    bool? isGTTouched,
    bool? isCorrest,
    String? x0,
    String? x1,
    String? x2,
    String? x3,
    String? pv0,
    String? pv1,
    String? pv2,
    String? pv3,
  }) {
    return Problem(
      problemWidget: problemWidget ?? this.problemWidget,
      problem: problem ?? this.problem,
      userAnswer: userAnswer ?? this.userAnswer,
      answer: answer ?? this.answer,
      numberAnswer: numberAnswer ?? this.numberAnswer,
      userNumberAnswer: userNumberAnswer ?? this.userNumberAnswer,
      isChecked: isChecked ?? this.isChecked,
      isCorrest: isCorrest ?? this.isCorrest,
      isMRTouched: isMRTouched ?? this.isMRTouched,
      isGTTouched: isGTTouched ?? this.isGTTouched,
      x0: x0 ?? this.x0,
      x1: x1 ?? this.x1,
      x2: x2 ?? this.x2,
      x3: x3 ?? this.x3,
      pv0: pv0 ?? this.pv0,
      pv1: pv1 ?? this.pv1,
      pv2: pv2 ?? this.pv2,
      pv3: pv3 ?? this.pv3,
    );
  }
}
