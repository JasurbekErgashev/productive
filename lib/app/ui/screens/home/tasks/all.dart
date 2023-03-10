import 'package:flutter/material.dart';
import 'package:productive/app/ui/screens/home/tasks/widgets/task_widget.dart';
import 'package:productive/theme.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TaskWidget(
          title: 'Something',
          date: '12:00 - 12:30',
          description: 'Here is your description',
          icon: Icon(Icons.abc_sharp),
          iconColor: Colors.orange,
          leftContainerColor: Colors.red,
        ),
        TaskWidget(
          title: 'Something',
          date: '12:00 - 12:30',
          description: 'Here is your description',
          icon: Icon(Icons.book),
          iconColor: Colors.green,
          leftContainerColor: Colors.orange,
        ),
      ],
    );
  }
}
