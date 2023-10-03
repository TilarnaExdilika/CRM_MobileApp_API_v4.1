// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/screens/list_screens.dart';
import 'package:ionicons/ionicons.dart';

class ListCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;
  final String leadId;

  const ListCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.url,
    required this.leadId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        onTap: () {
          // Khi ListCard được nhấn, chuyển leadId cho DetailScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(leadId: leadId),
            ),
          );
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        trailing: Icon(
          Ionicons.menu_outline,
          color: Theme.of(context).textTheme.subtitle2!.color,
        ),
        title: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ),
    );
  }

  /// Example: Use the url_launcher package to open the browser
}
