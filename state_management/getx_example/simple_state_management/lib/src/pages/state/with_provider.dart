import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/src/controller/count_controller_with_provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Provider",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          // // 상태를 구독하고 UI에 반영
          // Text(
          //   "${Provider.of<CountControllerWithProvider>(context).count}",
          //   style: const TextStyle(fontSize: 50),
          // ),
          Consumer<CountControllerWithProvider>(
            builder: (_, snapshot, child) {
              return Text(
                "${snapshot.count}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .increase();
            },
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
