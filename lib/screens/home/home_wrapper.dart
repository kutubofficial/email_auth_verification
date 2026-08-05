import 'package:flutter/material.dart';
import 'package:login_signup/screens/home/categories_screen.dart';
import 'package:login_signup/screens/home/dashboard_screen.dart';
import 'package:login_signup/screens/home/profile_screen.dart';
import 'package:login_signup/screens/home/wishlist_screen.dart';
import 'package:login_signup/widgets/custom_bottom_nav.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    CategoriesScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}