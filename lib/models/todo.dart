class Todo {
  String title;
  String description;
  String category;
  DateTime? dueDate;
  bool isCompleted;

  Todo({
    required this.title,
    this.description = '',
    this.category = '',
    this.dueDate,
    this.isCompleted = false,
  });
}