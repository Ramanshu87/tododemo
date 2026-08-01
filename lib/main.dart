import 'package:flutter/material.dart';
import 'package:flutter_application_arzoosir/screens/todo_screen.dart';

void main() {
  runApp(const TodoWidget());
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
