import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class GTButtonWidget extends ConsumerStatefulWidget {
  final functionEnum value;
  const GTButtonWidget({Key? key, required this.value}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PortalFunctionButtonWidgetState();
}

class _PortalFunctionButtonWidgetState extends ConsumerState<GTButtonWidget> {
  //bool _isPortalVisible = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final functionEnum value = widget.value;
    final memoryList = ref.watch(displayControllerProvider).gt;
    final isVisible = ref.watch(displayControllerProvider).gt.isNotEmpty;
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
          portalFollower: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
            decoration: BoxDecoration(
              color: isVisible ? Colors.blue[500] : Colors.transparent,
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
                    style: CustomTextTheme.getGTPupupTextWhite(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          child: GestureDetector(
            onTap: () {
              ref.read(calculatorControllerProvider.notifier).makeGTResult();
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
        ),
      ),
    );
  }
}
