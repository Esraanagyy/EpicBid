import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigationBarWidget({super.key, required this.selectedIndex});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Prevent unnecessary navigation

    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacementNamed(context, StorePage.id);
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, AuctionPage.id);
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, ProfilePage.id);
    } else {
      Navigator.pushReplacementNamed(context, HomePage.id);
    }
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding:
            EdgeInsets.symmetric(horizontal: isSelected ? 16 : 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2D5356) : Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 8),
      child: Container(
        width: 260,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home, "Home"),
            _buildNavItem(1, Icons.store, "Store"),
            _buildNavItem(2, Icons.gavel, "Auction"),
            _buildNavItem(3, Icons.person, "Profile"),
          ],
        ),
      ),
    );
  }
}
