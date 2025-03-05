import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/add_todo.dart';

class HomePage extends StatefulWidget {
  // final varType varName;

  const HomePage({super.key /*, this.varName*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });

    updateLocalData();

    Navigator.pop(context);
  }

  Future<void> updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('todoList', todoList);
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []);
    });
  }

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: Drawer(child: Text('Menu')),
    appBar: AppBar(
      centerTitle: true,
      title: Text('Todo App'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder:
                    (context) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 250,
                        child: AddTodo(addTodo: addTodo),
                      ),
                    ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                // Iconos de Material UI 3
                Icons.add,
              ),
            ),
          ),
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(todoList[index]),
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
                        todoList.removeAt(index);
                      });

                      updateLocalData();

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
    ),
  );
}
