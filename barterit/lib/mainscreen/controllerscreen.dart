import 'package:barteritcopy/mainscreen/sellerscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'homescreen.dart';
import 'postscreen.dart';
import 'profilescreen.dart';
import '../object/user.dart';

class ControllerScreen extends StatefulWidget {
  final User user;
  const ControllerScreen({super.key, required this.user});

  @override
  State<ControllerScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<ControllerScreen> {
  int _currentIndex = 0;
  late List<Widget> tabs;
  @override
  void initState() {
    super.initState();
    tabs = [
      HomeScreen(user: widget.user),
      const PostScreen(),
      SellerScreen(user: widget.user),
      // NotificationScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff000022),
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            backgroundColor: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.indigo,
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.person_2,
                text: 'Notification',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            onTabChange: (value) {
              _currentIndex = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
