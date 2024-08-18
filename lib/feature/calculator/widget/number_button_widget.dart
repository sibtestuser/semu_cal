import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class NumberButtonWidget extends ConsumerWidget {
  final String value;
  const NumberButtonWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    bool isTouched =
        ref.watch(displayControllerProvider).touchedButton == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .numberButtonPressed(value);

          ref.read(displayControllerProvider.notifier).setTouchButton(value);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
              vertical: Constants.caculatorButtonVerticalPadding),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: isTouched ? Colors.yellow[900] : Pallete.blackColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value,
              style: CustomTextTheme.getButtonWhiteTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
