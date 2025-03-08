import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.text,
  });
  String? Function(String?)? validator;
  final String text;

  TextEditingController controller = TextEditingController();

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        label: RichText(
          text: TextSpan(
            text: widget.text,
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
        prefixIcon: Icon(Icons.man, size: 20),
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
