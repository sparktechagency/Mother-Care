import 'package:flutter/material.dart';
import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../widgets/nunny_appbar.dart';
import '../widgets/nunny_home_body_section.dart';

class NunnyHomeScreen extends StatelessWidget {
  const NunnyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NunnyAppbar(),
            NunnyHomeBodySection()
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),

    );
  }
}
