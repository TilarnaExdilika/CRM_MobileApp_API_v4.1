// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class ListCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;

  const ListCard(
      {Key? key, required this.title, required this.icon, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListTile(
        onTap: _launchUrl,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        trailing: Icon(Ionicons.menu_outline,
            color: Theme.of(context).textTheme.subtitle2!.color),
        title: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Text(
              (title),
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
  void _launchUrl() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
