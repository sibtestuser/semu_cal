// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/theme/pallete.dart';

final pen_Theme_Provider =
    StateNotifierProvider<PenThemeController, PenTheme>((ref) {
  return PenThemeController();
});

class PenThemeController extends StateNotifier<PenTheme> {
  PenThemeController() : super(PenTheme());

  void changeTheme(String type) {
    switch (type) {
      case 'white':
        state = PenTheme_white();
        break;
      case 'yellow':
        state = PenTheme_yellow();
        break;
      case 'black':
        state = PenTheme_black();
        break;
      default:
        state = PenTheme_black();
    }
  }

  Color getPenColor() {
    switch (state.type) {
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      case 'black':
        return Colors.black;
      default:
        return Colors.yellow;
    }
  }
}

class PenTheme {
  String get type => 'white';
  Color get topBackGroundColor => Colors.white;
}

class PenTheme_white extends PenTheme {
  @override
  String get type => 'white';
  @override
  Color get topBackGroundColor => Colors.grey[100]!;
}

class PenTheme_yellow extends PenTheme {
  @override
  String get type => 'yellow';
}

class PenTheme_black extends PenTheme {
  @override
  String get type => 'black';
  @override
  Color get topBackGroundColor => Pallete.darkGreyColor;
}
