enum Status {
  todo,
  progress,
  done,
}

class Todo {
  String id;
  String task;
  String createdAt;
  Status status;

  Todo({required this.id, required this.task,required this.createdAt, required this.status});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['_id'],
        task: json['task'],
        createdAt: json['createdAt'],
        status: Status.values.firstWhere(
          (element) => element.toString().split('.').last == json['status'],
        ));
  }
}
