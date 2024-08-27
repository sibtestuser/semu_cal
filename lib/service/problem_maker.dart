import 'package:flutter/material.dart';
import 'package:semu_cal/model/problem.dart';

abstract class ProblemMaker {
  Problem makeBasicProblem();
  Problem makeAdvancedProblem();
  String getAnswer();
  Widget getProblemWidget();
}
