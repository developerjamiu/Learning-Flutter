import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const myMap = {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
};

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    Todo todo = Todo(
      completed: map['completed'],
      id: map['id'],
      title: map['title'],
      userId: map['userId'],
    );

    return todo;
  }
}

class TodoListView extends StatefulWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  Future<void> getTodos() async {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
    );

    final response = await dio.get('/todos/1');

    if (response.statusCode != 200) {
      print(response.data);
      return;
    }

    Todo todo = Todo.fromMap(response.data);
    print(todo.title);
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('title'),
            subtitle: Text('isCompleted'),
          );
        },
      ),
    );
  }
}
