import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static final Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static final Color background = Color.fromRGBO(3, 37, 65, 1);
  static final Color buttonColor = Color(0xFF01B4E4);
  static final Color greyColor = Color.fromARGB(255, 119, 119, 119);
}

class AppTextStyle {
  static TextStyle style16 =
      const TextStyle(fontSize: kDefaultPadding, color: AppColors.blackColor);
}

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    foregroundColor: MaterialStateProperty.all(AppColors.buttonColor),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  );
}

const double kDefaultPadding = 16.0;
const double kDefalutSizedbox = 25.0;
