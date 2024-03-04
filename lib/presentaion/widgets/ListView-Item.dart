import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todotask/Data/Models/TaskModel.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({required this.TaskItem});

  final taskitem TaskItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TaskItem.taskTitle.toString()),
                  Text('${TaskItem.taskDate}')
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
