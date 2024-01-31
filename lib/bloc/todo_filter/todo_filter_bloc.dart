import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_bloc/bloc/todo/todos_bloc.dart';
import 'package:todo_with_bloc/models/todo_filter_model.dart';
import 'package:todo_with_bloc/models/todo_model.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoStatusBloc extends Bloc<TodosStatusEvent, TodosStatusState> {
  final TodosBloc _todosBloc;
  late StreamSubscription _todosSubscription;

  TodoStatusBloc({required TodosBloc todosBloc})
      : _todosBloc = todosBloc,
        super(TodosStatusLoading()) {
    on<UpdatesTodo>(_onUpdateTodosStatus);

    _todosSubscription = _todosBloc.stream.listen((state) {
      if (state is TodosLoaded) {
        add(
          UpdatesTodo(todos: state.todo),
        );
      }
    });
  }

  void _onUpdateTodosStatus(
    UpdatesTodo event,
    Emitter<TodosStatusState> emit,
  ) {
    List<Todo> pendingTodos = event.todos
        .where((todo) => todo.isCancelled == false && todo.isCompleted == false)
        .toList();
    List<Todo> completedTodos = event.todos
        .where((todo) => todo.isCompleted == true && todo.isCancelled == false)
        .toList();
    List<Todo> cancelledTodos =
        event.todos.where((todo) => todo.isCancelled == false).toList();

    emit(
      TodosStatusLoaded(
        pendingTodos: pendingTodos,
        completedTodos: completedTodos,
        cancelledTodos: cancelledTodos,
      ),
    );
  }

  @override
  Future<void> close() {
    _todosSubscription.cancel();
    return super.close();
  }
}
