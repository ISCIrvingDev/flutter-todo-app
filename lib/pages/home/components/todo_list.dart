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
    return (widget.todoList.isEmpty)
        ? Center(child: Text('There are no items'))
        : ListView.builder(
          itemCount: widget.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),

              // Especifica que solamente se va a poder deslizar de izquierda a derecha
              direction: DismissDirection.startToEnd,

              // Background cuando se desliza de izquierda a derecha
              background: Container(
                color: Colors.green[300],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ),

              // Background cuando se desliza de derecha a izquierda
              // secondaryBackground: Container(
              //   color: Colors.red[300],
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8),
              //         child: Icon(Icons.delete),
              //       ),
              //     ],
              //   ),
              // ),
              onDismissed: (direction) {
                setState(() {
                  widget.todoList.removeAt(index);
                });

                widget.updateLocalData();
              },
              child: ListTile(
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
              ),
            );
          },
        );
  }
}
