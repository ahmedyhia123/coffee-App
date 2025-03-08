import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  CustomPasswordTextFormField({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your password';
        } else if (value!.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: isPasswordVisible ? false : true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        label: RichText(
          text: TextSpan(
            text: 'PASSWORD',
            style: TextStyle(
              color: Colors.black, // Default text color
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
          // When the TextField is clicked
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black38, // Border color when focused
            width: 0.5, // Thicker border on focus
          ),
        ),
        labelStyle: TextStyle(),
        prefixIcon: Icon(Icons.password, size: 20),
        suffixIcon:
            isPasswordVisible
                ? IconButton(
                  icon: Icon(Icons.visibility, size: 20),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
                : IconButton(
                  icon: Icon(Icons.visibility_off, size: 20),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
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
