import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:coffee_app/screens/welcome_screen.dart';
import 'package:coffee_app/services/auth_service.dart';
import 'package:coffee_app/widgets/custom_bottom.dart';
import 'package:coffee_app/widgets/custom_email_text_form_field.dart';
import 'package:coffee_app/widgets/custom_password_text_form_field.dart';
import 'package:coffee_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            validator: (name) {
              if (name!.isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
            controller: nameController,
            text: 'NAME',
          ),
          SizedBox(
            height: 18,
          ),
          CustomEmailTextFormField(controller: emailController),
          SizedBox(
            height: 18,
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
            height: 60,
          ),
          GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });

                UserCredential? credential = await AuthService().signUpUser(
                    emailController.text,
                    passwordController.text,
                    nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Account created successfully! 🎉'),
                    duration: Duration(seconds: 2),
                  ),
                );
                DocumentSnapshot userDoc = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(credential?.user!.uid)
                    .get();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen(
                    user: userDoc,
                  );
                }));
                setState(() {
                  isLoading = false;
                });
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                  )
                : CustomBottom(
                    text: 'SIGN UP',
                  ),
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
              Text(
                'Sign Up',
                style: TextStyle(
                    decorationColor: Color(0xffA97C37),
                    decoration: TextDecoration.underline,
                    color: Color(0xffA97C37)),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
