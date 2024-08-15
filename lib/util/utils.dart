import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showSnackBar(BuildContext context, String text) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    if (context.mounted) {
      final snackBar = SnackBar(
        content: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(color: Colors.black), // 글씨 색을 검정으로 설정
        ),
        backgroundColor: Colors.white, // 배경색을 하얀색으로 설정
        duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  });
}
