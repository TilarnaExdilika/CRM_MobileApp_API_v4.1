// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: const [
            Header(
              text: 'bottom_nav_second',
              logoPath: 'assets/img/logo.png',
            ),
            SizedBox(height: 36),
          ]),
    );
  }
}
