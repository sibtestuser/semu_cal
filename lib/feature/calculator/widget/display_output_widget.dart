import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

class DisplayOutputWidget extends ConsumerWidget {
  const DisplayOutputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    final display = ref.watch(displayControllerProvider);
    String _output = '0';
    _output = ref.watch(displayControllerProvider).displyOutput;
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 30,
        ),
        decoration: const BoxDecoration(
          color: Pallete.blackColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Pallete.lightGreyColor,
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
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            display.gt.isEmpty ? '' : 'GT',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            display.kShow == operationEnum.none
                                ? ''
                                : 'K (${display.kShow.type})',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            display.operation == operationEnum.divide
                                ? '÷'
                                : '',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            display.operation == operationEnum.multiply
                                ? 'X'
                                : '',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            display.operation == operationEnum.minus ? '-' : '',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            display.operation == operationEnum.plus ? '+' : '',
                            style: CustomTextTheme.getExtraOutPutTextStyle(
                                context),
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
                    style: CustomTextTheme.getOutPutTextStyle(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
