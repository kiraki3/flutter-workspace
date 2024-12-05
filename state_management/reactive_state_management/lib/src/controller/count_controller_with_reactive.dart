import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  final RxDouble _double = 0.0.obs;
  RxString strValue = "".obs;
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> user = User(name: "츄츄", age: 23).obs;
  RxList list = [].obs;

  void increase() {
    count++;
    _double(424);
    nums(NUM.SECOND);
    user.update((user) {
      user?.name = "쵸쵸";
    });
    list.add("가");
    list.addIf(user.value.name == "츄츄", "아름답다"); // 앞에는 조건문을, 뒤에는 값을 넣어준다.
  }

  void putNumber(int value) {
    count(value);
  }

  @override
  void onInit() {
    ever(count, (_) => print("매번 호출"));
    once(count, (_) => print("한번만 호출"));
    debounce(count, (_) => print("마지막 변경(3초 후)에 한번만 호출"),
        time: const Duration(seconds: 3));
    interval(count, (_) => print("변경되고 있는 동안 1초마다 호출"),
        time: const Duration(seconds: 1));
    super.onInit();
  }
}
