// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    required this.title,
    required this.date,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.leftContainerColor,
    super.key,
  });
  final String title;
  final String date;
  final String description;
  final Icon icon;
  final Color iconColor;
  final Color leftContainerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.blueBlueBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10, top: 8),
                        decoration: BoxDecoration(
                          color: iconColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 38,
                        width: 38,
                        child: Center(
                          child: icon,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            title,
                            style:
                                ProductiveTheme.productiveTextTheme.bodyMedium,
                          ),
                          Text(
                            date,
                            style:
                                ProductiveTheme.productiveTextTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                ],
              ),
              const Text('we will discuss here'),
            ],
          ),
          Container(
            width: 10,
            height: 100,
            decoration: BoxDecoration(
              color: leftContainerColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
