import 'package:easeher_/screens/home.dart';
import 'package:easeher_/screens/men.dart';
import 'package:easeher_/screens/profile.dart';
import 'package:easeher_/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  final items = <Widget>[
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.search, size: 30, color: Colors.white),
    Icon(Icons.person, size: 30, color: Colors.white),
    Icon(Icons.info, size: 30, color: Colors.white),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          home(),
          SearchPage(),
          Profile(),
          MenSupportPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Colors.transparent,
        color: Colors.pink.shade400,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        items: items,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            tabController.index = index;
          });
        },
      ),
    );
  }
}
