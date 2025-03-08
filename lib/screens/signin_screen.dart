import 'package:coffee_app/widgets/login_form.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image at the top
          Positioned(
            top: -160,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/coffee_cup.png', // Replace with your image path
              scale: 4.5, // Adjust as needed
            ),
          ),

          // Content below the image
          Positioned.fill(
            top: 150, // Adjust based on image height
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ListView(children: [
                Column(
                  children: [
                    Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "We’ve already met!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                    SizedBox(height: 83),
                    LoginForm(),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
