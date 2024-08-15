import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/feature/calculator/widget/function_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/gt_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/mr_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/number_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/operator_button_widget.dart';

class ButtonWidget extends ConsumerWidget {
  const ButtonWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.calculatorOutsidePadding,
        ).copyWith(
          top: 20,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Pallete.darkGreyColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MRButtonWidget(value: functionEnum.mr),
                FunctionButtonWidget(value: functionEnum.mminus),
                FunctionButtonWidget(value: functionEnum.mplus),
                GTButtonWidget(value: functionEnum.gt),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NumberButtonWidget(value: "7"),
                NumberButtonWidget(value: "8"),
                NumberButtonWidget(value: "9"),
                OperatorButtonWidget(value: operationEnum.divide),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NumberButtonWidget(value: "4"),
                NumberButtonWidget(value: "5"),
                NumberButtonWidget(value: "6"),
                OperatorButtonWidget(value: operationEnum.multiply),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NumberButtonWidget(value: "1"),
                NumberButtonWidget(value: "2"),
                NumberButtonWidget(value: "3"),
                OperatorButtonWidget(value: operationEnum.minus),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FunctionButtonWidget(value: functionEnum.ac),
                NumberButtonWidget(value: "0"),
                OperatorButtonWidget(value: operationEnum.result),
                OperatorButtonWidget(value: operationEnum.plus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
