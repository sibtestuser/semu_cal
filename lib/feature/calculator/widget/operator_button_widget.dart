import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';

class OperatorButtonWidget extends ConsumerWidget {
  final operationEnum value;
  const OperatorButtonWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .operationButtonPress(value);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: Constants.caculatorButtonVerticalPadding),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Pallete.greyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value.type,
              style: CustomTextTheme.buttonTextWhite,
            ),
          ),
        ),
      ),
    );
  }
}
