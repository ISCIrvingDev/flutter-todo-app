import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // final varType varName;

  const HomePage({super.key /*, this.varName*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // widget.varName
  // varType varName;

  _HomePageState(); // : varName = varValue;

  @override
  initState() {
    super.initState();
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
          child: Icon(
            // Iconos de Material UI 3
            Icons.add,
          ),
        ),
      ],
    ),
  );
}
