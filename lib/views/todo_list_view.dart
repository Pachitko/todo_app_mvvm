import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/viewmodels/todo_viewmodel.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context);

    return ListView.builder(
        itemCount: todoViewModel.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoViewModel.todos[index].title),
            trailing: Checkbox(
              value: todoViewModel.todos[index].done,
              onChanged: (value) {
                todoViewModel.toggleTodoStatus(index);
              },
            ),
            onLongPress: () {
              todoViewModel.removeTodo(index);
            },
          );
        });
  }
}
