import 'package:flutter/material.dart';

class AvailableCupsListView extends StatefulWidget {
  const AvailableCupsListView({super.key});

  @override
  State<AvailableCupsListView> createState() => _AvailableCupsListViewState();
}

class _AvailableCupsListViewState extends State<AvailableCupsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: index == currentIndex
                        ? Color(0xff55433C)
                        : Color(0xffDCDCDC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: -40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Image.asset(
                            height: 80,
                            width: 80,
                            'assets/cups/cup_1.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Matcha Latte',
                              style: TextStyle(
                                fontSize: 13,
                                color: index == currentIndex
                                    ? Colors.white
                                    : Color(0xff131A2E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$22.00',
                              style: TextStyle(
                                color: index == currentIndex
                                    ? Colors.white
                                    : Color(0xffA97C37),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
