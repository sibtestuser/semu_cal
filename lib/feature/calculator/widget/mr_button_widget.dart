import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/cal_theme.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class MRButtonWidget extends ConsumerStatefulWidget {
  final functionEnum value;
  const MRButtonWidget({super.key, required this.value});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PortalFunctionButtonWidgetState();
}

class _PortalFunctionButtonWidgetState extends ConsumerState<MRButtonWidget> {
  @override
  Widget build(BuildContext context) {
    CalTheme calTheme = ref.watch(cal_Theme_Provider);
    final functionEnum value = widget.value;
    final memoryList = ref.watch(displayControllerProvider).memory;
    final isVisible = ref.watch(displayControllerProvider).memory.isNotEmpty;
    final listLength = memoryList.length > 3 ? 3 : memoryList.length;

    bool isTouched =
        ref.watch(displayControllerProvider).touchedButton == value.type;

    return Expanded(
      child: Portal(
        child: PortalTarget(
          visible: memoryList.isNotEmpty,
          anchor: const Aligned(
            follower: Alignment.bottomCenter,
            target: Alignment.topCenter,
          ),
          portalFollower: Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 8,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              decoration: BoxDecoration(
                color: isVisible ? Colors.red[300] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < listLength; i++)
                    Text(
                      memoryList[i].toString().substring(
                          0,
                          memoryList[i].toString().length > 8
                              ? 8
                              : memoryList[i].toString().length),
                      style: CustomTextTheme.getPupupTextWhite(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              ref.read(calculatorControllerProvider.notifier).makeMRResult();
              ref
                  .read(displayControllerProvider.notifier)
                  .setTouchButton(value.type);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Material(
                elevation: isTouched ? 8 : 5,
                borderRadius: BorderRadius.circular(8),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      vertical: Constants.caculatorButtonVerticalPadding),
                  decoration: BoxDecoration(
                    color: isTouched
                        ? Colors.yellow[900]
                        : calTheme.function_button_color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      value.type,
                      style: calTheme.getFuctionButtonTextStyle(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
