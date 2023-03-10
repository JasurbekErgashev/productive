import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child:
              Divider(color: AppColors.whiteOpac20, thickness: 1, endIndent: 6),
        ),
        Text('OR', style: AppTypography.pNormal),
        Expanded(
          child: Divider(color: AppColors.whiteOpac20, thickness: 1, indent: 6),
        ),
      ],
    );
  }
}
