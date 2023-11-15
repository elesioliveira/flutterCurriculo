import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  void changePage(int index) {
    pageController.animateToPage(
      currentPage.value = index,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );

    //  pageController.animateToPage(
    //     currentPage.value = index,
    //     duration: const Duration(seconds: 1),
    //     curve: Curves.ease,
    //   );
  }
}
