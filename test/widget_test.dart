import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todos_app/main.dart';
import 'package:todos_app/models/todo.dart';

void main() {
  testWidgets('Todo App Smoke Test', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const TodoApp());

    // Verify initial state
    expect(find.text('Todos'), findsOneWidget); // App bar title
    expect(find.byType(TextField), findsOneWidget); // Input field
    expect(find.text('Add Tools'), findsOneWidget); // Hint text
    expect(find.byType(Checkbox), findsNothing); // No todos initially
  });

  testWidgets('Add and Complete a Todo', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    // Add a new todo
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify todo appears
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);

    // Complete the todo
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Verify completion style
    final textWidget = tester.widget<Text>(find.text('Buy milk'));
    expect(textWidget.style?.decoration, TextDecoration.lineThrough);
  });
}