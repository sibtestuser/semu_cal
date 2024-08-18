import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';

import 'package:semu_cal/feature/calculator/widget/button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/display_output_widget.dart';

import 'package:semu_cal/responsive/responsive.dart';

class CalculatorWidget extends ConsumerStatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends ConsumerState<CalculatorWidget> {
  String _output = "0";
  final isMshowUp = false;
  final isGTshowUp = false;

  void _buttonPressed(String value) {
    setState(() {
      if (_output == "0") {
        _output = value;
      } else {
        _output += value;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 여기서 상태를 변경하는 것이 안전합니다.
      ref.read(displayControllerProvider.notifier).makeReset();
      ref.read(calculatorControllerProvider.notifier).makeReset();
    });
    // Reset the state when the widget is initialized
  }

  @override
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Responsive(
          child: Padding(
            padding: EdgeInsets.all(Constants.calculatorOutsidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                  // child: PageView(
                  //   children: <Widget>[
                  //     SingleChildScrollView(
                  //       child: Container(
                  //         //  height: 1000, // 예시로 큰 높이를 설정
                  //         color: Colors.blue, // 예시로 배경색을 설정
                  //         child: Center(child: Text('Page 1')),
                  //       ),
                  //     ),
                  //     SingleChildScrollView(
                  //       child: Container(
                  //         height: 2000, // 예시로 큰 높이를 설정
                  //         color: Colors.red, // 예시로 배경색을 설정
                  //         child: Center(child: Text('Page 2')),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 2000, // 예시로 큰 높이를 설정
                  //       color: Colors.green, // 예시로 배경색을 설정
                  //       child: Center(child: Text('Page 3')),
                  //     ),
                  //   ],
                  // ),
                ),
                DisplayOutputWidget(), //Expanded (flex: 1)

                ButtonWidget(), //expanded (flex: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
