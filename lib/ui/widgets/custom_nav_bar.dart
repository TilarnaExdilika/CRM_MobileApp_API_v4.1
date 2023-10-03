import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomCustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomCustomNavBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 2, right: 8, left: 8),
      elevation: 4,
      // ignore: deprecated_member_use
      color: Theme.of(context).bottomAppBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.list_outline),
            label: tr('list_data'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.add_outline),
            label: tr('list_insert'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.search_outline),
            label: tr('list_search'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.play_back_outline),
            label: tr('list_back'),
          ),
        ],
      ),
    );
  }
}
