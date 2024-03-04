class taskitem {
  final String? taskTitle;
  final String? taskDate;
  final bool? taskStatus;

  taskitem({this.taskDate, this.taskStatus, this.taskTitle});
  factory taskitem.fromjson(JsonData) {
    return taskitem(
        taskTitle: JsonData['Task-content'],
        taskDate: JsonData['Task-Date'],
        taskStatus: JsonData['Task-Status']);
  }
}
