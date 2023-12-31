// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/config/theme.dart';
import 'package:flutter_production_boilerplate/cubit/theme_cubit.dart';
import 'package:flutter_production_boilerplate/ui/screens/list_screens.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/first_screen/info_card.dart';
import 'package:ionicons/ionicons.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: [
            const Header(text: 'app_name', logoPath: 'assets/img/logo.png'),

            Card(
              elevation: 2,
              color: Theme.of(context).cardColor,

              /// Example: Getting border radius circular as const
              /// Nested Widgets do not need to be declared as const.
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SwitchListTile(
                onChanged: (bool newValue) {
                  /// Example: Change theme with Cubit
                  BlocProvider.of<ThemeCubit>(context).getTheme(ThemeState(
                      newValue ? AppThemes.darkTheme : AppThemes.lightTheme));
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                value: Theme.of(context).brightness == Brightness.dark,
                title: Row(
                  children: [
                    /// Examle: Ionicons
                    /// Available icons -> https://ionic.io/ionicons
                    Icon(Ionicons.moon_outline,
                        color: Theme.of(context).primaryColor),
                    const SizedBox(width: 16),
                    Text(
                      /// Example: Use the easy_translations package
                      tr('dark_mode_title'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .apply(fontWeightDelta: 2),
                    ),
                  ],
                ),
              ),
            ),

            /// Example: Good way to add space between items
            const SizedBox(height: 8),
            Card(
              elevation: 2,

              /// Example: Many items have their own colors inside of the ThemData
              /// You can overwrite them in [config/theme.dart].
              color: Theme.of(context).cardColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SwitchListTile(
                onChanged: (bool newValue) {
                  /// Example: Change locale
                  /// The initial locale is automatically determined by the library.
                  /// Changing the locale like this will persist the selected locale.
                  context.setLocale(
                      newValue ? const Locale('de') : const Locale('en'));
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                value: context.locale == const Locale('de'),
                title: Row(
                  children: [
                    Icon(Ionicons.text_outline,
                        color: Theme.of(context).primaryColor),
                    const SizedBox(width: 16),
                    Text(
                      tr('language_switch_title'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .apply(fontWeightDelta: 2),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 4 / 5,
              children: [
                /// Example: it is good practice to put widgets in separate files.
                /// This way the screen files won't become too large and
                /// the code becomes more clear.

                InfoCard(
                  title: 'sell',
                  content: 'sell',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'marketing',
                  content: 'marketing',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'product',
                  content: 'product',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'report',
                  content: 'report',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'payroll',
                  content: 'payroll',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'manage_kpis',
                  content: 'manage_kpis',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
                InfoCard(
                  title: 'system',
                  content: 'system',
                  icon: Ionicons.people_outline,
                  isPrimaryColor: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
