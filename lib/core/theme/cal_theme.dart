// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/theme/pallete.dart';
import 'package:semu_cal/core/theme/texttheme.dart';

final cal_Theme_Provider =
    StateNotifierProvider<CalculatorThemeController, CalTheme>((ref) {
  return CalculatorThemeController();
});

class CalculatorThemeController extends StateNotifier<CalTheme> {
  CalculatorThemeController() : super(CalTheme());

  void changeTheme(String type) {
    switch (type) {
      case 'white':
        state = CalTheme_White();
        break;
      case 'pink':
        state = CalTheme_Pink();
        break;
      case 'grey':
        state = CalTheme_Grey();
        break;
      default:
        state = CalTheme_White();
    }
  }
}

class CalTheme {
  String get type => 'white';
  Color get topBackGroundColor => Colors.white;
  Color get bottomBackGroundColor => Colors.white;
  Color get number_button_color => Colors.grey[600]!;
  Color get operation_button_color => Colors.grey[200]!;
  Color get function_button_color => Colors.grey[200]!;

  TextStyle getOutputDisplayTextStyle(BuildContext context) {
    return CustomTextTheme.getOutPutTextStyle(context);
  }

  TextStyle getExtraOutPutTextStyle(BuildContext context) {
    return CustomTextTheme.getExtraOutPutTextStyle(context);
  }

  TextStyle getNumberButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }

  TextStyle getOperationButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }

  TextStyle getFuctionButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }
}

class CalTheme_White extends CalTheme {
  @override
  String get type => 'white';
  @override
  Color get topBackGroundColor => Colors.grey[100]!;
  @override
  Color get bottomBackGroundColor => Colors.white;
  @override
  Color get number_button_color => Colors.grey[350]!;
  @override
  Color get operation_button_color => Colors.grey[200]!;
  @override
  Color get function_button_color => Colors.grey[200]!;
  @override
  TextStyle getOutputDisplayTextStyle(BuildContext context) {
    return CustomTextTheme.getOutPutTextStyle(context);
  }

  @override
  TextStyle getExtraOutPutTextStyle(BuildContext context) {
    return CustomTextTheme.getExtraOutPutTextStyle(context);
  }

  @override
  TextStyle getNumberButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }

  @override
  TextStyle getOperationButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context)
        .copyWith(color: Colors.blue[500]);
  }

  @override
  TextStyle getFuctionButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context)
        .copyWith(color: Colors.green[700]);
  }
}

class CalTheme_Pink extends CalTheme {
  @override
  String get type => 'pink';
  @override
  Color get topBackGroundColor => Color(0xFFFFB6C1);
  @override
  Color get bottomBackGroundColor => Color(0xFFFFCDD1);
  @override
  Color get number_button_color => Colors.white;
  @override
  Color get operation_button_color => Color(0xFFFFE4E1);
  @override
  Color get function_button_color => Color(0xFFFFE4E1);
  @override
  TextStyle getOutputDisplayTextStyle(BuildContext context) {
    return CustomTextTheme.getOutPutTextStyle(context);
  }

  @override
  TextStyle getExtraOutPutTextStyle(BuildContext context) {
    return CustomTextTheme.getExtraOutPutTextStyle(context);
  }

  @override
  TextStyle getNumberButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }

  @override
  TextStyle getOperationButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }

  @override
  TextStyle getFuctionButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context);
  }
}

class CalTheme_Grey extends CalTheme {
  @override
  String get type => 'grey';
  @override
  Color get topBackGroundColor => Pallete.darkGreyColor;
  @override
  Color get bottomBackGroundColor => Colors.grey[300]!;
  @override
  Color get number_button_color => Colors.grey[800]!;
  @override
  Color get operation_button_color => Colors.grey[500]!;
  @override
  Color get function_button_color => Colors.grey[500]!;

  @override
  TextStyle getOutputDisplayTextStyle(BuildContext context) {
    return CustomTextTheme.getOutPutTextStyle(context);
  }

  @override
  TextStyle getExtraOutPutTextStyle(BuildContext context) {
    return CustomTextTheme.getExtraOutPutTextStyle(context);
  }

  @override
  TextStyle getNumberButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context)
        .copyWith(color: Colors.white);
  }

  @override
  TextStyle getOperationButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context)
        .copyWith(color: Colors.white);
  }

  @override
  TextStyle getFuctionButtonTextStyle(BuildContext context) {
    return CustomTextTheme.getButtonTextStyle(context)
        .copyWith(color: Colors.black);
  }
}
