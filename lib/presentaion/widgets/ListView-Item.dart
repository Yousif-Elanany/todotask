import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todotask/data/Model/TaskModel.dart';



ListviewItem(taskTitle,taskDate){


  return Container(
      height: 80,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskTitle),
                  Text('${taskDate}')
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  ))
            ],
          ),
        ),
      ),
    );
}
