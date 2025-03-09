import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/widgets/available_cups_list_view.dart';
import 'package:coffee_app/widgets/coffee_types_list_view.dart';
import 'package:coffee_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final DocumentSnapshot user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -260,
            left: 0,
            right: 0,
            child: Image.asset(
              scale: 4.6,
              'assets/images/coffee_cup.png',
            ),
          ),
          Positioned.fill(
              top: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomAppBar(
                      name: user['name'],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: CoffeeTypesListView(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: AvailableCupsListView(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
