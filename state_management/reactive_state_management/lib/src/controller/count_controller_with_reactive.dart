import 'package:get/get.dart';

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }
}
