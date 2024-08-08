import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screen/Sign_in/widgets/google_signin.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            'assets/images/coffee.png',
          ),
          const Text(
            'Coffee so good,\n your taste buds\n will love it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'The best grain, the finest roast, the\n powerful flavor.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const GoogleSign(),
        ],
      ),
    );
  }
}
