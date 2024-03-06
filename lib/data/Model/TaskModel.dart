class taskitem {
  final int? id;
  final String? taskTitle;
  final String? taskDate;
  final bool? taskStatus;

  taskitem({this.taskDate, this.taskStatus, this.taskTitle,this.id});
  factory taskitem.fromjson(JsonData) {
    return taskitem(
      id: JsonData['id'],
        taskTitle: JsonData['content'],
        taskDate: JsonData['date'],
        taskStatus: JsonData['status']);
  }
}
