import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatefulWidget {
  final String text;
  final VoidCallback onFinished;
  const MyAnimatedText(
      {super.key, required this.text, required this.onFinished});

  @override
  State<MyAnimatedText> createState() => _MyAnimatedTextState();
}

class _MyAnimatedTextState extends State<MyAnimatedText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(widget.text),
        ],
        pause: const Duration(milliseconds: 100),
        isRepeatingAnimation: false,
        // totalRepeatCount: 1,
        onFinished: widget.onFinished);
  }
}
