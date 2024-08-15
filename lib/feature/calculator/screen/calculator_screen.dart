import 'package:flutter/material.dart';
import 'package:semu_cal/core/constants/constants.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/widget/button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/display_output_widget.dart';
import 'package:semu_cal/feature/calculator/widget/function_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/number_button_widget.dart';
import 'package:semu_cal/feature/calculator/widget/operator_button_widget.dart';
import 'package:semu_cal/responsive/responsive.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Responsive(
          child: Padding(
            padding: const EdgeInsets.all(Constants.calculatorOutsidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: PageView(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Container(
                          //  height: 1000, // 예시로 큰 높이를 설정
                          color: Colors.blue, // 예시로 배경색을 설정
                          child: Center(child: Text('Page 1')),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 2000, // 예시로 큰 높이를 설정
                          color: Colors.red, // 예시로 배경색을 설정
                          child: Center(child: Text('Page 2')),
                        ),
                      ),
                      Container(
                        height: 2000, // 예시로 큰 높이를 설정
                        color: Colors.green, // 예시로 배경색을 설정
                        child: Center(child: Text('Page 3')),
                      ),
                    ],
                  ),
                ),
                const DisplayOutputWidget(), //Expanded (flex: 1)

                const ButtonWidget(), //expanded (flex: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
