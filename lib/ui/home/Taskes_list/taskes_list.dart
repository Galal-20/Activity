import 'package:activity/ui/components/task-items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TaskesList extends StatefulWidget {
  const TaskesList({super.key});

  @override
  State<TaskesList> createState() => _TaskesListState();
}

class _TaskesListState extends State<TaskesList> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
          TaskItem(),
        ],
      ),
    );
  }
}
