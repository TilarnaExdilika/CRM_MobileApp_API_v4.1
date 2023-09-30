// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  final String logoPath;

  const Header({Key? key, required this.text, required this.logoPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 36),
      child: Row(
        children: [
          // Hiển thị logo
          Padding(
            padding: const EdgeInsets.only(
                right: 8.0), // Khoảng cách giữa logo và tiêu đề
            child: Image.asset(
              logoPath,
              width: 50, // Điều chỉnh kích thước của logo ở đây
              height: 50, // Điều chỉnh kích thước của logo ở đây
            ),
          ),
          // Hiển thị tiêu đề
          Text(
            tr(text),
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .apply(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
