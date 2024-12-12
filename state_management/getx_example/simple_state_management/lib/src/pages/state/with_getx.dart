import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_state_management/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({super.key});

  Widget _button(String id) {
    return TextButton(
      onPressed: () {
        Get.find<CountControllerWithGetx>().increase(id);
      },
      child: const Text(
        "+",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GetX",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          GetBuilder<CountControllerWithGetx>(
            id: "first",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          GetBuilder<CountControllerWithGetx>(
            id: "second",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          _button("first"),
          _button("second"),
        ],
      ),
    );
  }
}
