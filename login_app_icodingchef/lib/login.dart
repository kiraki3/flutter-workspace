import 'package:flutter/material.dart';
import 'package:login_app_icodingchef/my_button/my_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyButton(
            imageAsset: Image.asset('images/glogo.png'),
            imageWidth: 20.0,
            imageHeight: 20.0,
            text: 'Login with Google',
            color: Colors.white,
            radius: 0.0,
            onPressed: () {},
          ),
          const SizedBox(
            height: 10.0,
          ),
          MyButton(
            imageAsset: Image.asset('images/flogo.png'),
            imageWidth: 20.0,
            imageHeight: 20.0,
            text: 'Login with Facebook',
            color: const Color(0xFF334D92),
            radius: 0.0,
            onPressed: () {},
          ),
          const SizedBox(
            height: 10.0,
          ),
          MyButton(
            imageAsset: const Icon(
              Icons.mail,
              color: Colors.white,
            ),
            imageWidth: 20.0,
            imageHeight: 20.0,
            text: 'Login with Email',
            color: Colors.green,
            radius: 0.0,
            onPressed: () {},
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
