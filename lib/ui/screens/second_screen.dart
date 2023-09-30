// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/second_screen/grid_item.dart';
import 'package:flutter_production_boilerplate/ui/widgets/second_screen/link_card.dart';
import 'package:flutter_production_boilerplate/ui/widgets/second_screen/text_divider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: [
            const Header(
              text: 'bottom_nav_second',
              logoPath: 'assets/img/logo.png',
            ),
            const LinkCard(
                title: 'github_card_title',
                icon: Ionicons.logo_github,
                url: 'https://github.com'),
            const TextDivider(text: 'author_divider_title'),
            const LinkCard(
                title: 'user_title',
                icon: Ionicons.person_circle_outline,
                url: ''),
            // const SizedBox(height: 6),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: const [
                GridItem(
                  title: 'user',
                  icon: Ionicons.person,
                  url: '',
                ),
                GridItem(
                  title: 'role',
                  icon: Ionicons.lock_closed,
                  url: '',
                ),
                GridItem(
                  title: 'password',
                  icon: Ionicons.key,
                  url: '',
                ),
                GridItem(
                  title: 'security_groups',
                  icon: Ionicons.shield,
                  url: '',
                ),
                GridItem(
                  title: 'confidential_security',
                  icon: Ionicons.eye_off,
                  url: '',
                ),
              ],
            ),
            const TextDivider(text: 'packages_divider_title'),
            const LinkCard(
                title: 'system_title', icon: Ionicons.server_outline, url: ''),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: const [
                GridItem(
                  title: 'system_settings',
                  icon: Ionicons.settings_outline,
                  url: '',
                ),
                GridItem(
                  title: 'import_wizard',
                  icon: Ionicons.arrow_down_circle_outline,
                  url: '',
                ),
                GridItem(
                  title: 'internal',
                  icon: Ionicons.settings_outline,
                  url: '',
                ),
                GridItem(
                  title: 'upgrader',
                  icon: Ionicons.arrow_up_circle_outline,
                  url: '',
                ),
                GridItem(
                  title: 'currency',
                  icon: Ionicons.earth_outline,
                  url: '',
                ),
                GridItem(
                  title: 'backup',
                  icon: Ionicons.download_outline,
                  url: '',
                ),
                GridItem(
                  title: 'language',
                  icon: Ionicons.language_outline,
                  url: '',
                ),
                GridItem(
                  title: 'repair',
                  icon: Ionicons.hammer_outline,
                  url: '',
                ),
                GridItem(
                  title: 'diagnostic_information',
                  icon: Ionicons.bug_outline,
                  url: '',
                ),
                GridItem(
                  title: 'connect',
                  icon: Ionicons.link_outline,
                  url: '',
                ),
                GridItem(
                  title: 'topic',
                  icon: Ionicons.color_palette_outline,
                  url: '',
                ),
                GridItem(
                  title: 'schedule',
                  icon: Ionicons.calendar_outline,
                  url: '',
                ),
                GridItem(
                  title: 'activity_stream_settings',
                  icon: Ionicons.speedometer_sharp,
                  url: '',
                ),
                GridItem(
                  title: 'oauth_key_code',
                  icon: Ionicons.key_outline,
                  url: '',
                ),
                GridItem(
                  title: 'oauth2_clients_and_tokens',
                  icon: Ionicons.key_outline,
                  url: '',
                ),
              ],
            ),
            // const SizedBox(height: 8),
            const TextDivider(text: 'email_title'),
            LinkCard(
                title: 'email_title',
                icon: MdiIcons.emailMarkAsUnread,
                url: ''),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: [
                GridItem(
                  title: 'custom_email',
                  icon: MdiIcons.emailFastOutline,
                  url: '',
                ),
                GridItem(
                  title: 'inbox',
                  icon: MdiIcons.emailArrowLeftOutline,
                  url: '',
                ),
                GridItem(
                  title: 'email_sent',
                  icon: MdiIcons.emailArrowRightOutline,
                  url: '',
                ),
                GridItem(
                  title: 'email_campaigns',
                  icon: MdiIcons.emailSearchOutline,
                  url: '',
                ),
                GridItem(
                  title: 'email_queue',
                  icon: MdiIcons.emailMultipleOutline,
                  url: '',
                ),
              ],
            ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
