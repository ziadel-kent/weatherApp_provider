import 'package:flutter/material.dart';
import 'package:moreeeeee/presentation/screens/basketball_counter_screen.dart';
import 'package:moreeeeee/presentation/screens/business_card_screen.dart';
import 'package:moreeeeee/presentation/screens/news_screen.dart';
import 'package:moreeeeee/presentation/screens/search_screen.dart';
import 'package:moreeeeee/presentation/screens/toku_app_screen.dart';

import 'presentation/screens/tunes_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    BusinessCard(),
    // BasketballCounter(),
    // TokuApp(),
    // TunesApp(),
    // NewsApp(),
    HomeScreen(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedIndex > 0)
                      controller.jumpToPage(selectedIndex - 1);
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [Icon(Icons.arrow_back, color: Colors.black)],
                    ),
                  ),
                ),
              ),
              // back
              Spacer(flex: 1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedIndex < screens.length - 1)
                      controller.jumpToPage(selectedIndex + 1);
                    else {
                      if (selectedIndex == screens.length - 1) {
                        selectedIndex = 0;
                        controller.jumpToPage(selectedIndex);
                      } else if (selectedIndex <= 0) {
                        selectedIndex = screens.length - 1;
                        controller.jumpToPage(selectedIndex);
                      }
                    }
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Next page',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Icon(Icons.arrow_forward_sharp, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              // forward
            ],
          ),
        ),
      ),
    );
  }
}
