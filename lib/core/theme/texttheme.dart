import 'package:flutter/material.dart';
import 'package:semu_cal/core/enum/enum.dart';

//themeenum 은 추후에 provider 로
class CustomTextTheme {
  static TextStyle getOutPutTextStyle(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 38;
    } else if (width >= 400 && width < 600) {
      fontSize = 42;
    } else {
      fontSize = 60;
    }
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle getExtraOutPutTextStyle(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 12;
    } else if (width >= 400 && width < 600) {
      fontSize = 15;
    } else {
      fontSize = 18;
    }
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle getButtonTextStyle(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 26;
    } else if (width >= 400 && width < 600) {
      fontSize = 30;
    } else {
      fontSize = 45;
    }
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle getButtonWhiteTextStyle(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 26;
    } else if (width >= 400 && width < 600) {
      fontSize = 30;
    } else {
      fontSize = 40;
    }
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle getPupupTextBlack(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 15;
    } else if (width >= 400 && width < 600) {
      fontSize = 17;
    } else {
      fontSize = 20;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getPupupTextWhite(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 15;
    } else if (width >= 400 && width < 600) {
      fontSize = 17;
    } else {
      fontSize = 20;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getGTPupupTextWhite(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 13;
    } else if (width >= 400 && width < 600) {
      fontSize = 15;
    } else {
      fontSize = 17;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getMainMenuTextWhite(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 40;
    } else if (width >= 400 && width < 600) {
      fontSize = 45;
    } else {
      fontSize = 50;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getMainMenuTextBlack(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 30;
    } else if (width >= 400 && width < 600) {
      fontSize = 35;
    } else {
      fontSize = 40;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getsubMainMenuDescriptionTextBlack(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 15;
    } else if (width >= 400 && width < 600) {
      fontSize = 17;
    } else {
      fontSize = 20;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getsubMainMenuTextBlack(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 25;
    } else if (width >= 400 && width < 600) {
      fontSize = 27;
    } else {
      fontSize = 30;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.2,
    );
  }

  static TextStyle getIntroText(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 26;
    } else if (width >= 400 && width < 600) {
      fontSize = 30;
    } else {
      fontSize = 40;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
  }

  static TextStyle getSubIntroText(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 13;
    } else if (width >= 400 && width < 600) {
      fontSize = 15;
    } else {
      fontSize = 17;
    }
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey);
  }

  static TextStyle getClassText(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 17;
    } else if (width >= 400 && width < 600) {
      fontSize = 19;
    } else {
      fontSize = 24;
    }
    return TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
        fontSize: fontSize); // Set
  }

  static TextStyle getClassTextBlack(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize;
    if (width < 400) {
      fontSize = 17;
    } else if (width >= 400 && width < 600) {
      fontSize = 19;
    } else {
      fontSize = 24;
    }
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: fontSize); // Set
  }
  // static const displayPopupBlack = TextStyle(
  //   fontSize: 15,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.black,
  //   letterSpacing: 1.2, // Increase the spacing here
  // );

  // static const displayPopupwhite = TextStyle(
  //   fontSize: 15,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.white,
  //   letterSpacing: 1.2, // Increase the spacing here
  // );

  // static const smalldisplayPopupwhite = TextStyle(
  //   fontSize: 13,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.white,
  //   letterSpacing: 1.2, // Increase the spacing here
  // );
  static const guideTextBlack = TextStyle(fontSize: 15, color: Colors.black);
  static const guideTextWhite = TextStyle(fontSize: 15, color: Colors.white);
  static const guideTextBlue = TextStyle(fontSize: 15, color: Colors.blue);
  static const guideTextRed = TextStyle(fontSize: 15, color: Colors.red);
}
