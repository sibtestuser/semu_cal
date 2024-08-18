import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/cal_theme.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class DisplayOutputWidget extends ConsumerWidget {
  const DisplayOutputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CalTheme calTheme = ref.watch(cal_Theme_Provider);
    final width = MediaQuery.of(context).size.width;
    //print(width);
    final display = ref.watch(displayControllerProvider);
    String _output = '0';
    _output = ref.watch(displayControllerProvider).displyOutput;
    return Expanded(
      flex: 1,
      child: Material(
        elevation: 5,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: calTheme.topBackGroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, -5), // 그림자를 위쪽으로 이동
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[100]!,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              display.memory.isEmpty ? '' : 'M',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              display.gt.isEmpty ? '' : 'GT',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              display.kShow == operationEnum.none
                                  ? ''
                                  : 'K (${display.kShow.type})',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              display.operation == operationEnum.divide
                                  ? '÷'
                                  : '',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              display.operation == operationEnum.multiply
                                  ? 'X'
                                  : '',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              display.operation == operationEnum.minus
                                  ? '-'
                                  : '',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              display.operation == operationEnum.plus
                                  ? '+'
                                  : '',
                              style: calTheme.getExtraOutPutTextStyle(context),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      _output,
                      style: calTheme.getOutputDisplayTextStyle(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
