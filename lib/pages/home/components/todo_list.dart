import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final List<String> todoList;
  final void Function() updateLocalData;

  const TodoList({
    super.key,
    required this.todoList,
    required this.updateLocalData,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(widget.todoList[index]),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.todoList.removeAt(index);
                      });

                      widget.updateLocalData();

                      Navigator.pop(context);
                    },
                    child: Text('Mark as done!'),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
