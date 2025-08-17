import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggleCompleted;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggleCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) => onToggleCompleted(),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (todo.description.isNotEmpty)
              Text(todo.description),
            if (todo.dueDate != null)
              Text(
                'Due: ${todo.dueDate!.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}