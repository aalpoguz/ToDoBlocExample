part of 'todo_filter_bloc.dart';

abstract class TodosStatusEvent extends Equatable {
  const TodosStatusEvent();

  @override
  List<Object> get props => [];
}

class UpdatesTodo extends TodosStatusEvent {
  final List<Todo> todos;

  const UpdatesTodo({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}
