class Todo {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime? dueDate;
  bool isCompleted;

  Todo({
    this.id = '',
    required this.title,
    this.description = '',
    this.category = 'Personal',
    this.dueDate,
    this.isCompleted = false,
  });
}