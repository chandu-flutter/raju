import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thandri_sannidhi/pages/home.dart';
import 'package:thandri_sannidhi/pages/prayer_garden.dart';
import 'package:thandri_sannidhi/pages/tithe.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    const PrayerGarden(),
    const HomeScreen(),
    const Tithe(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: const Color.fromARGB(255, 54, 1, 63),
        buttonBackgroundColor: const Color.fromARGB(255, 54, 1, 63),
        backgroundColor: Colors.transparent, index: _selectedIndex,
        // buttonBackgroundColor: const Color.fromARGB(255, 54, 1, 63),
        items: [
          Icon(
            //MdiIcons.handsPray,
            MdiIcons.beach,
            //MdiIcons.bookCross,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Image.asset(
            "images/tithe.png",
            width: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
