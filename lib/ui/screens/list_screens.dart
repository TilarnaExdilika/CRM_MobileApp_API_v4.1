// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/list_screen/list_card.dart';
import 'package:ionicons/ionicons.dart';

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
            Header(text: 'menu', logoPath: 'assets/img/logo.png'),
            //List
            ListCard(
                title: 'name here',
                icon: Ionicons.person_circle_outline,
                url: ''),

            SizedBox(height: 8),
          ]),
    );
  }
}
