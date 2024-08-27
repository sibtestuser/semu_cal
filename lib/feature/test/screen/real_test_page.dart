import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/x_year_widget_with_pv.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/problem/controller/problemcontroller.dart';
import 'package:semu_cal/model/class_model.dart';
import 'package:semu_cal/model/problem.dart';

class RealTestViewWidget extends ConsumerStatefulWidget {
  const RealTestViewWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RealTestViewWidgetState();
}

class _RealTestViewWidgetState extends ConsumerState<RealTestViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(problemControllerProvider.notifier).makeProblem();
    });
  }

  @override
  Widget build(BuildContext context) {
    Problem test = ref.watch(problemControllerProvider);
    ClassEnum classType = ref.watch(classModelProvider).classtype;
    //  print('정답 :$test.numberAnswer');
    // test.problemWidget = X3YearWidgetWithPV();
    TextStyle defaultStyle = TextStyle(
      fontSize: CustomTextTheme.getClassTextSize(context),
      color: Colors.black,
    );
    TextStyle problemStyle = TextStyle(
      fontSize: CustomTextTheme.getClassTextSize(context),
      color: Colors.black,
    );
    TextStyle answerStyle = TextStyle(
      fontSize: CustomTextTheme.getClassTextSize(context),
      color: Colors.red,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (classType == ClassEnum.memory)
              Text('MR 버튼으로 Recall 후 정답을 확인 해 주세요',
                  style: defaultStyle.copyWith(color: Colors.blue)),
            if (classType == ClassEnum.gt)
              Text('GT 버튼으로 Recall 후 정답을 확인 해 주세요',
                  style: defaultStyle.copyWith(color: Colors.blue)),
            const SizedBox(
              height: 10,
            ),
            if (test.problemWidget != null) test.problemWidget!,
            if (test.problemWidget != null)
              SizedBox(
                height: 15,
              ),
            Text(
              test.problem == '' ? '다음문제 버튼을 눌러주세요' : test.problem,
              style: problemStyle.copyWith(height: 1.1),
            ),
            if (test.problemWidget != null)
              SizedBox(
                height: 10,
              ),
            if (test.isChecked)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: test.isCorrest
                        ? [
                            Text('정답입니다.', style: answerStyle),
                            Text(
                              '정답 : ' + test.numberAnswer.toStringAsFixed(3),
                              style: answerStyle,
                            ),
                          ]
                        : [
                            Text('다시 해볼까요?',
                                style:
                                    answerStyle.copyWith(color: Colors.blue)),
                            Text(
                              '정답 : ' + test.numberAnswer.toStringAsFixed(3),
                              style: answerStyle,
                            ),
                          ],
                  ),
                ),
              ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
