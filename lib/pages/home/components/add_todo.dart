import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final void Function({required String todoText}) addTodo;

  const AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Todo App'),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: 'Write your todo here...',
          ),
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            print('El valor es: ${todoText.text}');
            widget.addTodo(todoText: todoText.text);

            todoText.text = '';
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
