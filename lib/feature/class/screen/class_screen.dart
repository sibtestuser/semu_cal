import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/feature/calculator/screen/calculator_screen.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/class/screen/class_pageview.dart';
import 'package:semu_cal/mainmenu.dart';

import 'package:semu_cal/responsive/responsive.dart';

class ClassScreen extends ConsumerWidget {
  const ClassScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classModel = ref.watch(classModelProvider);
    String appbatTitle = '';
    switch (classModel.classtype) {
      case ClassEnum.memory:
        appbatTitle = 'Memory 알아보기';
        break;
      case ClassEnum.gt:
        appbatTitle = 'GT 알아보기';
        break;
      case ClassEnum.k:
        appbatTitle = 'K 알아보기';
        break;
      case ClassEnum.none:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainMenuScreen(),
          ),
        );
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appbatTitle),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: SafeArea(
        child: Responsive(
          child: Stack(
            children: [
              CalculatorWidget(),
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
            ],
          ),
        ),
      ),
    );
  }
}
