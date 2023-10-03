import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/screens/insert_screens.dart';
import 'package:flutter_production_boilerplate/ui/screens/list_screens.dart';
import 'package:flutter_production_boilerplate/ui/widgets/custom_nav_bar.dart';
import 'package:flutter_production_boilerplate/ui/widgets/unmated.dart';

class SearchScreen extends StatelessWidget {
  final int currentIndex = 2;

  const SearchScreen({Key? key}) : super(key: key);

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
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              NoAnimationPageRoute(builder: (context) => const InsertScreen()),
            );
          } else if (index == 0) {
            Navigator.pushReplacement(
              context,
              NoAnimationPageRoute(builder: (context) => const ListScreen()),
            );
          }
        },
      ),
    );
  }
}
