import 'package:flutter/material.dart';
import 'package:todo_with_bloc/bloc/todo_filter/todo_filter_bloc.dart';
import 'package:todo_with_bloc/models/todo_filter_model.dart';
import 'package:todo_with_bloc/models/todo_model.dart';
import 'package:todo_with_bloc/view/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo/todos_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(
                todos: [
                  Todo(
                    id: '1',
                    task: 'first task',
                    description: 'first desc',
                  ),
                  Todo(
                    id: '2',
                    task: 'second task',
                    description: 'second desc',
                  ),
                ],
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TodoStatusBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          )..add(UpdatesTodo()),
        ),
        // BlocProvider(
        //     create: (context) =>
        //         TodoStatusBloc(todosBloc: BlocProvider.of<TodosBloc>(context)))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
