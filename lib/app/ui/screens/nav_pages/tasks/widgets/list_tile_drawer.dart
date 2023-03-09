import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productive/theme.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // splashColor: AppColors.blueDarkBlue2,
      title: Row(
        children: [
          FaIcon(
            icon,
            color: AppColors.grey,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
