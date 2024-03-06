import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  CollectionReference task = FirebaseFirestore.instance.collection('Tasks');

  void addTask(
      {String? Datecon, String? Titlecon, TaskStatus = false, context}) {
    emit(TasksLoadingState());
    task.add({
      'Task-Date': Datecon,
      'Task-Status': TaskStatus,
      'Task-content': Titlecon
    }).then((value) {
      Navigator.pop(context);
      emit(TasksSuccessState());
    });
  }
}
