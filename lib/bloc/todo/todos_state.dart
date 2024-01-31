part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodoLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todo;

  TodosLoaded({this.todo = const <Todo>[]});

  @override
  List<Object> get props => [todo];
}

class TodosError extends TodosState {}
