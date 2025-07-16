import 'package:flutter/material.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parents Home"),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}
