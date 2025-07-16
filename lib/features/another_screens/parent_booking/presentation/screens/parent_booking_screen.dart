import 'package:flutter/material.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';

class ParentBookingScreen extends StatelessWidget {
  const ParentBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parents Bookings"),
      ),

      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
