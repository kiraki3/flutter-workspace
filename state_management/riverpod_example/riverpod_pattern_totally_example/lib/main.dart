import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // 앱의 진입점으로, ProviderScope로 전체 앱을 감싸서 Riverpod 상태 관리 기능을 활성화
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}

// Riverpod 상태를 사용하기 위해 ConsumerWidget을 확장한 HomeView 클래스
class HomeView extends ConsumerWidget {
  HomeView({super.key});
  // 상태 관리용 StateNotifierProvider를 정의하고 Counter 클래스의 인스턴스를 제공
  final counterProvider = StateNotifierProvider((ref) => Counter());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // counterProvider의 상태를 관찰하여 count 변수에 저장
    final count = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${count.toString()}"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  // 버튼을 눌렀을 때 Counter의 상태를 증가
                  ref.watch(counterProvider.notifier).increment();
                },
                child: const Text("Increment"))
          ],
        ),
      ),
    );
  }
}

class Counter extends StateNotifier<int> {
  // Counter 클래스는 StateNotifier를 상속받아 상태 관리 역할
  // 초기 상태를 0으로 설정
  Counter() : super(0);

  void increment() => state++;
}
