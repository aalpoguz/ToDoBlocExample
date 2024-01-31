part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {
  final List<Todo> todos;

  const LoadTodos({this.todos = const <Todo>[]});
}

class AddTodo extends TodosEvent {
  final Todo todo;

  AddTodo({required this.todo});
}

class UpdateTodo extends TodosEvent {
  final Todo todo;

  UpdateTodo({required this.todo});
}

class RemoveTodo extends TodosEvent {
  final Todo todo;

  RemoveTodo({required this.todo});
}
