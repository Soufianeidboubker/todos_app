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
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: todos.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty_illustration.png', height: screenHeight * 0.3),
                  SizedBox(height: 20),
                  Text('No todos yet!', style: TextStyle(fontSize: 20)),
                ],
              )
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    todo: todos[index],
                    onToggleCompleted: () {
                      setState(() {
                        todos[index].isCompleted = !todos[index].isCompleted;
                      });
                    },
                  );
                },
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
          if (newTodo != null) {
            setState(() {
              todos.add(newTodo);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}