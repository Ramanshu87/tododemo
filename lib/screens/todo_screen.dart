import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_arzoosir/screens/models/task.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController txtTitle = TextEditingController();
  List<Task> tasks = [];
  bool isChecked = false;
  int selInd = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: txtTitle)),
              IconButton(
                onPressed: () {
                  if (txtTitle.text.isNotEmpty) {
                    log(txtTitle.text);
                    if (selInd == -1) {
                      tasks.add(Task(txtTitle.text, false));
                    } else {
                      tasks[selInd].title = txtTitle.text;
                      selInd = -1;
                    }
                    txtTitle.text = "";
                    setState(() {});
                  }
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Checkbox(
                  value: tasks[index].iscompleted,
                  onChanged: (v) {
                    tasks[index].iscompleted = v!;
                    setState(() {});
                  },
                ),
                title: Text(
                  tasks[index].title,
                  style: TextStyle(
                    color: tasks[index].iscompleted ? Colors.red : Colors.black,
                  ),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: tasks[index].iscompleted
                            ? null
                            : () {
                                txtTitle.text = tasks[index].title;
                                selInd = index;
                                setState(() {});
                              },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          tasks.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: tasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
