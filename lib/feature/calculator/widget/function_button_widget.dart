import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';

class FunctionButtonWidget extends ConsumerWidget {
  final functionEnum value;
  const FunctionButtonWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .functionButtonPressed(value, context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: Constants.caculatorButtonVerticalPadding),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Pallete.lightGreyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value.type,
              style: CustomTextTheme.buttonTextBlack,
            ),
          ),
        ),
      ),
    );
  }
}
