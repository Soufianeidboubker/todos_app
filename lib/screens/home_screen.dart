import 'package:flutter/material.dart';
import '../widgets/todo_item.dart';
import '../models/todo.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Todos')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: _todos.isEmpty
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/task.png',
                height: 180,
                errorBuilder: (ctx, error, stack) =>
                const Icon(Icons.assignment, size: 80),
              ),
              const SizedBox(height: 20),
              const Text(
                'No todos yet!',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          )
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _todos.length,
            itemBuilder: (ctx, index) => TodoItem(
              todo: _todos[index],
              onToggle: () => _toggleTodo(index),
              onDelete: () => _deleteTodo(index),  // Add this
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTodo,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewTodo() async {
    final newTodo = await Navigator.push<Todo>(
      context,
      MaterialPageRoute(builder: (ctx) => const AddTodoScreen()),
    );
    if (newTodo != null) {
      setState(() => _todos.add(newTodo));
    }
  }

  void _toggleTodo(int index) {
    setState(() => _todos[index].isCompleted = !_todos[index].isCompleted);
  }

  void _deleteTodo(int index) {  // Add this method
    setState(() => _todos.removeAt(index));
  }
}