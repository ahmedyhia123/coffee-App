import 'package:flutter/material.dart';

class CustomEmailTextFormField extends StatefulWidget {
  CustomEmailTextFormField({super.key, required this.controller});

  TextEditingController controller = TextEditingController();

  @override
  State<CustomEmailTextFormField> createState() =>
      _CustomEmailTextFormFieldState();
}

class _CustomEmailTextFormFieldState extends State<CustomEmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your email';
        } else if (!value!.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        label: RichText(
          text: TextSpan(
            text: 'EMAIL',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black38, // Border color when focused
            width: 0.5, // Thicker border on focus
          ),
        ),
        labelStyle: TextStyle(),
        prefixIcon: Icon(Icons.email, size: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Border color
            width: 2.5, // Thickness of the border
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
