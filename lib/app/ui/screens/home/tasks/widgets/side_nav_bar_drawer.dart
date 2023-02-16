import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productive/app/ui/screens/home/tasks/widgets/list_tile_drawer.dart';
import 'package:productive/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.dark,
      child: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.blueMediumBlue,
                  child: const FaIcon(FontAwesomeIcons.user, size: 30),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Jasurbek Ergashev',
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'jasurbek.fm@gmail.com',
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTileDrawer(
            title: 'Premium',
            icon: FontAwesomeIcons.solidStar,
            onTap: () {},
          ),
          ListTileDrawer(
            title: 'Settings',
            icon: FontAwesomeIcons.gear,
            onTap: () {},
          ),
          ListTileDrawer(
            title: 'Articles',
            icon: FontAwesomeIcons.newspaper,
            onTap: () {},
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.white.withOpacity(0.2),
          ),
          ListTileDrawer(
            title: 'Help',
            icon: FontAwesomeIcons.circleH,
            onTap: () {},
          ),
          ListTileDrawer(
            title: 'Terms',
            icon: FontAwesomeIcons.circleInfo,
            onTap: () {},
          ),
          ListTileDrawer(
            title: 'FAQ',
            icon: FontAwesomeIcons.circleQuestion,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
