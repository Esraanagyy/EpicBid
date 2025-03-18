import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'profile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 3,
      ),
    );
  }
}
