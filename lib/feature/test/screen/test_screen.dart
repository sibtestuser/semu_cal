import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/screen/calculator_screen.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/class/screen/class_pageview.dart';
import 'package:semu_cal/mainmenu.dart';

import 'package:semu_cal/responsive/responsive.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '테스트',
        ),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: SafeArea(
        child: Responsive(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClassMainPageView(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
              CalculatorWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
