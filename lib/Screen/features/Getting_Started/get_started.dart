import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/features/Getting_Started/get_number.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              height: 44.49,
              width: 134.48,
              child: Image.asset('assets/images/Layer1.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 320.0),
            child: Text(
              'Be on track of what happened',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: index == 1 ? Colors.white : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GetNumber()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(345, 48),
                backgroundColor: const Color(0xffFF593D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
