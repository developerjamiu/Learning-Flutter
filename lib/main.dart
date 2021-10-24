import 'package:flutter/material.dart';
import 'package:good_architecture/views/todo_list_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Good Architecture',
      home: TodoListView(),
    );
  }
}
