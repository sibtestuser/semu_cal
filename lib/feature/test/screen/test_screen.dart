import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:semu_cal/feature/calculator/screen/calculator_screen.dart';

import 'package:semu_cal/feature/test/controller/test_controller.dart';
import 'package:semu_cal/feature/test/screen/test_page_view.dart';

import 'package:semu_cal/responsive/responsive.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '문제 풀어보기',
        ),
        backgroundColor: Colors.blueGrey[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Responsive(
          child: Stack(
            children: [
              const CalculatorWidget(),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: TestMainPageView(), // 얘가 실제 페이지
                    ),
                    Expanded(
                      flex: 2,
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: Colors.transparent,
                        ),
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
