import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/src/controller/count_controller_with_getx.dart';
import 'package:simple_state_management/src/controller/count_controller_with_provider.dart';
import 'package:simple_state_management/src/pages/state/with_getx.dart';
import 'package:simple_state_management/src/pages/state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 선언
    Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: const WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
