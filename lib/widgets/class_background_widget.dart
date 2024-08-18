import 'package:flutter/material.dart';

class ClassBackgroundWidget extends StatelessWidget {
  final Widget child;
  const ClassBackgroundWidget({super.key, required this.child});

//얘 는 칠판 백그라운드

//page view 아래에 그려지는 부분이야.  우리가 이걸 배이스로 class 를 만들거야
// Text
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0), // Add padding around the container
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1B5E20),

          /// Dark green color for chalkboard
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DefaultTextStyle(
            style: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 17), // Set text color to white
            child: child,
          ),
        ),
      ),
    );
  }
}
