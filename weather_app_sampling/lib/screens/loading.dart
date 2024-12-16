import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Position 객체에서 분리하여 별도의 변수로 저장
  double? latitude2;
  double? longitude2;

  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location permissions are denied.");
      return;
    }

    // 예외처리
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print("There was a problem with the internet connection.");
    }
  }

  // 날씨씨 데이터 가져오기
  void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      jsonDecode(jsonData);
      var myJson = jsonDecode(jsonData);
      // 배열을 부를 때
      // var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      // print(myJson);

      // 객체를 부를 때
      print(myJson['wind']['speed']);
      print(myJson['id']);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 59, 167, 255),
          ),
          child: const Text(
            "Get my location",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
