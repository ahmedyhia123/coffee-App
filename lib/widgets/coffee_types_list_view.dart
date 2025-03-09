import 'package:coffee_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeTypesListView extends StatefulWidget {
  const CoffeeTypesListView({super.key});

  @override
  State<CoffeeTypesListView> createState() => _CoffeeTypesListViewState();
}

class _CoffeeTypesListViewState extends State<CoffeeTypesListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        itemCount: types.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index == currentIndex
                    ? Color(0xff55433C)
                    : Color(0xffDCDCDC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 18,
                      child: Image.asset(
                          'assets/coffees/${types[index]['path']}')),
                  Text(
                    types[index]['name']!,
                    style: TextStyle(
                        color: index == currentIndex
                            ? Colors.white
                            : Color(0xff131A2E).withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
