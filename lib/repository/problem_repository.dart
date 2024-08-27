import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/test/controller/test_controller.dart';
import 'package:semu_cal/model/class_model.dart';
import 'package:semu_cal/model/problem.dart';
import 'package:semu_cal/model/test_model.dart';
import 'package:semu_cal/service/gt_problem_maker.dart';
import 'package:semu_cal/service/k_problem_maker.dart';
import 'package:semu_cal/service/memory_problem_maker.dart';
import 'package:semu_cal/service/problem_maker.dart';

final problemRepositoryProvider = Provider<ProblemRepository>((ref) {
  return ProblemRepository(ref);
});

class ProblemRepository {
  Ref ref;

  ProblemMaker? problemaker;

  ProblemRepository(this.ref) {
    //_initializeProblemMaker();
  }

  // void _initializeProblemMaker() {
  //   switch (classType!.classtype) {
  //     case ClassEnum.memory:
  //       problemaker = ref.read(MemoryServiceProvider);
  //       break;
  //     case ClassEnum.gt:
  //       problemaker = ref.read(GTSerivceProvider);
  //       break;
  //     case ClassEnum.k:
  //       problemaker = ref.read(KServiceProvider);
  //       break;
  //     case ClassEnum.none:
  //       problemaker = ref.read(MemoryServiceProvider);
  //       break;
  //   }
  // }

  Problem makeNewProblem() {
    final classType = ref.watch(classModelProvider.notifier).getClassModel;
    final testType = ref.watch(testModelProvider.notifier).getTestModel;
    switch (classType!.classtype) {
      case ClassEnum.memory:
        problemaker = ref.read(MemoryServiceProvider);
        if (testType!.testtype == TestEnum.basic) {
          return problemaker!.makeBasicProblem();
        } else {
          return problemaker!.makeAdvancedProblem();
        }
      case ClassEnum.gt:
        problemaker = ref.read(GTSerivceProvider);
        if (testType!.testtype == TestEnum.basic) {
          return problemaker!.makeBasicProblem();
        } else {
          return problemaker!.makeAdvancedProblem();
        }
        break;
      case ClassEnum.k:
        problemaker = ref.read(KServiceProvider);
        break;
      case ClassEnum.none:
        problemaker = ref.read(MemoryServiceProvider);
        break;
    }
    if (testType.testtype == TestEnum.basic) {
      return problemaker!.makeBasicProblem();
    }
    return problemaker!.makeAdvancedProblem();
  }
}
