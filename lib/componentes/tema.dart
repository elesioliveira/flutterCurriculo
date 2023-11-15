import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}

class SelectColor extends GetxController {
  RxBool selectColor = false.obs;

  void selectColorTile(bool newValue) {
    selectColor.value = !newValue;
  }
}

abstract class CustomColorPalette {
  static Color get primaryColor => const Color.fromARGB(255, 168, 127, 245);
  static Color get secondaryColor => const Color(0xFF8639FA);
  static Color get tertiaryColor => const Color(0xFF6E0AFA);

  // Adicione outras cores conforme necessário
}
