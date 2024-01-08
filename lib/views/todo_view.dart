import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/viewmodels/todo_viewmodel.dart';
import 'package:to_do_app/views/todo_list_view.dart';
import 'package:to_do_app/views/add_todo_view.dart';

class TodoApp extends StatelessWidget {
  final todoViewModel = TodoViewModel();

  TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoViewModel>(
      create: (context) => todoViewModel,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        title: 'Todo App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Todo list'),
          ),
          body: Column(
            children: [
              AddTodoView(),
              const SizedBox(height: 20),
              Expanded(child: TodoListView())
            ],
          ),
        ),
      ),
    );
  }
}
