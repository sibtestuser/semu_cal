import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/model/problem.dart';
import 'package:semu_cal/service/memory_problem_maker.dart';
import 'package:semu_cal/service/problem_maker.dart';

final GTSerivceProvider = Provider<GTService>((ref) {
  return GTService();
});

class GTService extends ProblemMaker {
  MemoryService memoryService = MemoryService();
  @override
  String getAnswer() {
    return 'answer';
  }

  @override
  Widget getProblemWidget() {
    // TODO: implement getProblemWidget
    throw UnimplementedError();
  }

  @override
  Problem makeAdvancedProblem() {
    // TODO: implement makeAdvancedProblem
    return memoryService.makeGTAdvancedProblem();
  }

  @override
  Problem makeBasicProblem() {
    // TODO: implement makeBasicProblem
    return memoryService.makeGTbasicProblem();
  }
}
