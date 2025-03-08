import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 370,
      decoration: BoxDecoration(
          color: Color(0xff55433C), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(
            flex: 4,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
