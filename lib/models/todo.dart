class Todo {
  final String title;
  final String description;
  final String category;
  final DateTime? dueDate;
  bool isCompleted;

  Todo({
    required this.title,
    this.description = '',
    this.category = '',
    this.dueDate,
    this.isCompleted = false,
  });
}