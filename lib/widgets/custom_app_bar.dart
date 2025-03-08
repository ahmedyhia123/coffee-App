import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                height: 40,
                'assets/images/profile.png',
              ),
              Spacer(),
              SvgPicture.asset(height: 10, 'assets/images/Frame.svg'),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(
                "Hi, ",
                style: TextStyle(fontSize: 32),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
              decoration: InputDecoration(
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w300),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                child: Icon(
                  color: Colors.grey,
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: CircleAvatar(
                backgroundColor: Color(0xff55433C),
                radius: 20,
                child: SvgPicture.asset(
                  'assets/images/setting.svg',
                  height: 15,
                ),
              ),
            ),
            hintText: 'Coffee shop, beer & wine...',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffDCDCDC), width: 2),
                borderRadius: BorderRadius.circular(200)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffDCDCDC), width: 2),
                borderRadius: BorderRadius.circular(200)),
          ))
        ],
      ),
    );
  }
}
