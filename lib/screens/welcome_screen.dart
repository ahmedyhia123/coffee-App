import 'package:coffee_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/Logo.png',
              scale: 4,
            ),
          ),
          SizedBox(
            height: 43,
          ),
          Image.asset(
            'assets/images/coffee_cup.png',
            scale: 4,
          ),
          Text(
            'Find your favorite',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          Text(
            'Coffee Taste!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 37,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            textAlign: TextAlign.center,
            'We’re coffee shop, beer and wine bar,\n& event space for performing arts',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SigninScreen();
              }));
            },
            child: Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xff55433C),
                  borderRadius: BorderRadius.circular(30)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xffA97C37),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
