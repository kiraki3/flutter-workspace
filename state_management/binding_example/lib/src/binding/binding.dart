import 'package:binding_example/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(CountControllerWithGetx());
  }
}
