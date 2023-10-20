import 'package:get/get.dart';

class PageViewController extends GetxController {
  RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}
