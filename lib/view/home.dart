import 'package:flutter/material.dart';
import 'package:todo_with_bloc/models/todo_model.dart';
import 'package:todo_with_bloc/view/add_todo_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görevlerim'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => AddTodoPage()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bekleyen görevler',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: Todo.todo.length,
                itemBuilder: (BuildContext context, int index) {
                  return _todoCard(Todo.todo[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _todoCard(Todo todo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${todo.id}) ${todo.task}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
