import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();

    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  // 시간을 가리키는 변수
  String getSystemTime() {
    var now = DateTime.now();

    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //title: const Text(''),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover, // 화면을 꽉 채우도록 설정
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 180.0,
                            ),
                            Text(
                              'Seoul',
                              style: GoogleFonts.lato(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (const Duration(minutes: 1)),
                                  builder: (context) {
                                    print(getSystemTime());
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                          fontSize: 18.0, color: Colors.white),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 18.0, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '18\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('svg/climacon-sun.svg'),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Clear Sky',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Image.asset(
                                'image/bad.png',
                                width: 37.0,
                                height: 35.0,
                              ),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                '147.75',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                '84.03',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
