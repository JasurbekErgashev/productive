// ignore_for_file: lines_longer_than_80_chars, avoid_field_initializers_in_const_classes, use_decorated_box

import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    required this.title,
    required this.date,
    required this.icon,
    required this.iconColor,
    required this.leftContainerColor,
    super.key,
  });
  final String title;
  final String date;
  final Icon icon;
  final Color iconColor;
  final Color leftContainerColor;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.blueBlueBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        //dense: true,
        contentPadding: const EdgeInsets.only(left: 8),
        leading: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: widget.iconColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: widget.icon,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration:
                    _check ? TextDecoration.lineThrough : TextDecoration.none,
                decorationThickness: 2.5,
                decorationColor: Colors.grey,
              ),
            ),
            Text(
              widget.date,
              style: TextStyle(
                color: Colors.white,
                decoration:
                    _check ? TextDecoration.lineThrough : TextDecoration.none,
                decorationThickness: 2.5,
                decorationColor: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                value: _check,
                onChanged: (value) {
                  setState(() {
                    _check = !_check;
                  });
                }),
            Container(
              width: 10,
              decoration: BoxDecoration(
                color: widget.leftContainerColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
