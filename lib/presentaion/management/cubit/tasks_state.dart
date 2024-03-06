part of 'tasks_cubit.dart';

@immutable
class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoadingState extends TasksState {}

class TasksSuccessState extends TasksState {}

class TasksFailerState extends TasksState {
  final String error;

  TasksFailerState({required this.error});
}
