import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!, width: 1),),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home', index: 0),
              _navItem(icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view, label: 'Categories', index: 1),
              _navItem(icon: Icons.favorite_border, activeIcon: Icons.favorite, label: 'Wishlist', index: 2),
              _navItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile', index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isSelected ? activeIcon : icon,
            color: isSelected ? Colors.black : Colors.grey[400],size: 26,
          ),
          const SizedBox(height: 4),
          Text(label,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 15,fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}