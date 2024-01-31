import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/models/todo_filter_model.dart';
import '../bloc/todo/todos_bloc.dart';

import '../bloc/todo_filter/todo_filter_bloc.dart';
import '../models/todo_model.dart';
import 'add_todo_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text('Görevlerim'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => AddTodoPage()));
              },
              icon: Icon(Icons.add),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  _todos('Bekleyenler');
                  break;
                case 1:
                  _todos('Tamamlananlar');
                  break;
              }
            },
            tabs: const [
              Tab(
                icon: Icon(Icons.pending),
              ),
              Tab(
                icon: Icon(Icons.add_task),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _todos('Yapılacaklar'),
            _todos('Tamamlananlar'),
          ],
        ),
      ),
    );
  }

  BlocBuilder<TodoStatusBloc, TodosStatusState> _todos(String title) {
    return BlocBuilder<TodoStatusBloc, TodosStatusState>(
      builder: (context, state) {
        if (state is TodosStatusLoading) {
          return const CircularProgressIndicator();
        }
        if (state is TodosStatusLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.pendingTodos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _todoCard(context, state.pendingTodos[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text('Hata');
        }
      },
    );
  }

  Card _todoCard(BuildContext context, Todo todo) {
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
                onPressed: () {
                  context
                      .read<TodosBloc>()
                      .add(UpdateTodo(todo: todo.copyWith(isCompleted: true)));
                },
                icon: const Icon(Icons.check),
              ),
              IconButton(
                onPressed: () {
                  context.read<TodosBloc>().add(
                        RemoveTodo(todo: todo),
                      );
                },
                icon: const Icon(Icons.delete),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
