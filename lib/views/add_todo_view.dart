import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/viewmodels/todo_viewmodel.dart';

class AddTodoView extends StatefulWidget {
  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context);

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
          hintText: "Enter a new todo",
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                todoViewModel.addTodo(_controller.text);
                _controller.clear();
              }
            },
          )),
    );
  }
}
