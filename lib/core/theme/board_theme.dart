// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/theme/pallete.dart';

final board_Theme_Provider =
    StateNotifierProvider<BoardThemeController, BoardTheme>((ref) {
  return BoardThemeController();
});

class BoardThemeController extends StateNotifier<BoardTheme> {
  BoardThemeController() : super(BoardTheme());

  void changeTheme(String type) {
    switch (type) {
      case 'white':
        state = BoardTheme_white();
        break;
      case 'green':
        state = BoardTheme_green();
        break;
      case 'grey':
        state = BoardTheme_grey();
        break;
      default:
        state = BoardTheme_green();
    }
  }

  Color getBoardColor() {
    switch (state.type) {
      case 'white':
        return Colors.white;
      case 'green':
        return Colors.green[700]!;
      case 'grey':
        return Colors.grey[700]!;
      default:
        return Colors.green[700]!;
    }
  }
}

class BoardTheme {
  String get type => 'white';
  Color get topBackGroundColor => Colors.white;
}

class BoardTheme_white extends BoardTheme {
  @override
  String get type => 'white';
  @override
  Color get topBackGroundColor => Colors.grey[100]!;
}

class BoardTheme_green extends BoardTheme {
  @override
  String get type => 'green';
}

class BoardTheme_grey extends BoardTheme {
  @override
  String get type => 'grey';
  @override
  Color get topBackGroundColor => Pallete.darkGreyColor;
}
