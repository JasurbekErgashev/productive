import 'package:flutter/material.dart';
import 'package:productive/app/ui/screens/home/tasks/widgets/task_widget.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TaskWidget(
          title: 'GYM time',
          date: '12:00 AM - 12:30 AM',
          icon: Icon(Icons.sports_mma_sharp, color: Colors.white),
          iconColor: Colors.orange,
          leftContainerColor: Colors.red,
        ),
        TaskWidget(
          title: 'Meet the cdevs team',
          date: '12:00 AM - 12:30 AM',
          icon: Icon(Icons.book, color: Colors.white),
          iconColor: Colors.green,
          leftContainerColor: Colors.orange,
        ),
      ],
    );
  }
}
