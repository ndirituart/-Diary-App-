import 'package:flutter/material.dart';
import 'package:project_idea/pages/main.dart';
// ignore: unused_import
import 'package:project_idea/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyToDoListPage extends StatefulWidget {
  const MyToDoListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyToDoListPageState createState() => _MyToDoListPageState();
}

class _MyToDoListPageState extends State<MyToDoListPage> {
  final _todoItems = List<String>.generate(10, (index) => '');
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    _todoItems[index] = 'Completed: ${_todoItems[index]}';
                  } else {
                    _todoItems[index] = _todoItems[index];
                  }
                });
              },
            ),
            title: Text(
              _todoItems[index],
              style: _todoItems[index].isNotEmpty ? _biggerFont : null,
            ),
          );
        },
      ),
    );
  }
}
