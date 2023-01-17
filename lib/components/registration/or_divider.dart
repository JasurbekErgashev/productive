import 'package:flutter/material.dart';

import '../../theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: AppColors.white.withOpacity(0.2),
            thickness: 1,
            endIndent: 6,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.white.withOpacity(0.2),
            thickness: 1,
            indent: 6,
          ),
        ),
      ],
    );
  }
}
