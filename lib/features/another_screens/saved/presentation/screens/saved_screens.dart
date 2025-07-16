import 'package:flutter/material.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';

class SavedScreens extends StatelessWidget {
  const SavedScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),

      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
    );
  }
}
