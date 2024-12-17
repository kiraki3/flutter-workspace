import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
        width: 34.0,
        height: 35.0,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.black87,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    } else {
      // 모든 조건에 해당하지 않으면 기본 아이콘 반환
      return SvgPicture.asset(
        'svg/icon.svg',
        color: Colors.black87,
      );
    }
  }

  Widget? getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        'image/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 5) {
      return Image.asset(
        'image/bad.png',
        width: 37.0,
        height: 35.0,
      );
    } else {
      // 모든 조건에 해당하지 않으면 기본 아이콘 반환
      return SvgPicture.asset(
        'image/good.png',
        color: Colors.black87,
      );
    }
  }

  Widget? getAirCondition(int index) {
    if (index == 1) {
      return const Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 2) {
      return const Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 3) {
      return const Text(
        '"보통"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 4) {
      return const Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 5) {
      return const Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      // 모든 조건에 해당하지 않으면 기본 텍스트 반환
      return const Text(
        '"쏘쏘"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
