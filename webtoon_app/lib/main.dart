import 'package:flutter/material.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'screens/home_screen.dart';

void main() {
  ApiService.getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); // 위젯의 key 를 stateless widget 이라는 슈퍼클래스에 보냄

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
