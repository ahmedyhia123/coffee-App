import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:coffee_app/screens/signup_screen.dart';
import 'package:coffee_app/screens/welcome_screen.dart';
import 'package:coffee_app/services/auth_service.dart';
import 'package:coffee_app/widgets/custom_bottom.dart';
import 'package:coffee_app/widgets/custom_email_text_form_field.dart';
import 'package:coffee_app/widgets/custom_password_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomEmailTextFormField(controller: emailController),
          SizedBox(
            height: 25,
          ),
          CustomPasswordTextFormField(controller: passwordController),
          SizedBox(height: 14),
          Text(
            'Forgot password?',
            style: TextStyle(
                fontSize: 18,
                color: Color(0xffA97C37),
                decorationColor: Color(0xffA97C37),
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                print('Validated');
                setState(() {
                  isLoading = true;
                });
                try {
                  UserCredential userCredential =
                      await firebaseAuth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  DocumentSnapshot userDoc = await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userCredential.user!.uid)
                      .get();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                          user: userDoc,
                        );
                      },
                    ),
                  );

                  print("User signed in!");
                  setState(() {
                    isLoading = false;
                  });
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No user found for that email.')),
                    );
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Wrong password provided for that user.')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message!)),
                    );
                  }
                } catch (e) {
                  log("Unknown Error: $e");
                }
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: isLoading
                ? CircularProgressIndicator(
                    color: Color(0xffA97C37),
                  )
                : CustomBottom(text: 'Sign In'),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account? ',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      decorationColor: Color(0xffA97C37),
                      decoration: TextDecoration.underline,
                      color: Color(0xffA97C37)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
