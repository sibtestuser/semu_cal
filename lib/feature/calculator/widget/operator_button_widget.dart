import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class OperatorButtonWidget extends ConsumerWidget {
  final operationEnum value;
  const OperatorButtonWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTouched =
        ref.watch(displayControllerProvider).touchedButton == value.type;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .operationButtonPress(value);

          ref
              .read(displayControllerProvider.notifier)
              .setTouchButton(value.type);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
              vertical: Constants.caculatorButtonVerticalPadding),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: isTouched ? Colors.yellow[900] : Pallete.greyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value.type,
              style: CustomTextTheme.getButtonWhiteTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
