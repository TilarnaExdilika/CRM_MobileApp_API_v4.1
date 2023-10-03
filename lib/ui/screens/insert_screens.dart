import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/screens/first_screen.dart';
import 'package:flutter_production_boilerplate/ui/screens/list_screens.dart';
import 'package:flutter_production_boilerplate/ui/screens/search_srceen.dart';
import 'package:flutter_production_boilerplate/ui/widgets/custom_nav_bar.dart';
import 'package:flutter_production_boilerplate/ui/widgets/unmated.dart';

class InsertScreen extends StatelessWidget {
  final int currentIndex = 1;

  const InsertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Content of Insert Screen'),
      ),
      bottomNavigationBar: BottomCustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              NoAnimationPageRoute(builder: (context) => const SearchScreen()),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              NoAnimationPageRoute(builder: (context) => const ListScreen()),
            );
          }
        },
      ),
    );
  }
}
