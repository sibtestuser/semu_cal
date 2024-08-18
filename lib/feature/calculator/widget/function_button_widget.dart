import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class FunctionButtonWidget extends ConsumerWidget {
  final functionEnum value;
  const FunctionButtonWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    bool isTouched =
        ref.watch(displayControllerProvider).touchedButton == value.type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .functionButtonPressed(value, context);
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
            color: isTouched ? Colors.yellow[900] : Pallete.lightGreyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value.type,
              style: CustomTextTheme.getButtonTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
