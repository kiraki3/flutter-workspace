import 'package:flutter/material.dart';
import 'package:weather_app_sampling/data/my_location.dart';
import 'package:weather_app_sampling/data/network.dart';
import 'package:weather_app_sampling/screens/weather_screen.dart';

const apikey = '996c052876c761dfb66db3c426b9414a';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Position 객체에서 분리하여 별도의 변수로 저장
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);
    // weather screen 이동
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  // 날씨 데이터 가져오기
  // void fetchData() async {

  //     var myJson = jsonDecode(jsonData);
  //     // 배열을 부를 때
  //     // var myJson = jsonDecode(jsonData)['weather'][0]['description'];
  //     // print(myJson);

  //     // 객체를 부를 때
  //     print(myJson['wind']['speed']);
  //     print(myJson['id']);
  //   } else {
  //     print(response.statusCode);
  //   }
  //}

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
