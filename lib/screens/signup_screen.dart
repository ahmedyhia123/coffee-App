import 'package:coffee_app/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: ListView(children: [
                Column(
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Let’s create you an account.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
                SignupForm(),
              ]),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
