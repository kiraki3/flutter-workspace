import 'package:flutter/material.dart';
import 'package:login_app_icodingchef/login.dart';

class MyButton extends StatelessWidget {
  // 코드를 재사용하기 위한 변수들
  final Widget imageAsset;
  final double imageWidth;
  final double imageHeight;
  final String text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    required this.text,
    required this.color,
    required this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)), // 각진 테두리
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: imageAsset, // 전달된 Widget을 그대로 사용
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black87, fontSize: 15.0),
          ),
          const Opacity(
            opacity: 0.0,
          ),
        ],
      ),
    );
  }
}
