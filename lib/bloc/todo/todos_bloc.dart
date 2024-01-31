import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_bloc/models/todo_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<RemoveTodo>(_onRemoveTodo);
  }

  void _onLoadTodo(LoadTodos event, Emitter<TodosState> emit) {
    emit(TodosLoaded(todo: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;

    if (state is TodosLoaded) {
      emit(TodosLoaded(
        todo: List.from(state.todo)..add(event.todo),
      ));
    }
  }

  void _onRemoveTodo(RemoveTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todo = state.todo.where(
        (e) {
          return e.id != event.todo.id;
        },
      ).toList();
      emit(TodosLoaded(todo: todo));
    }
  }

  void _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodosState> emit,
  ) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todos = (state.todo.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();

      emit(TodosLoaded(todo: todos));
    }
  }
}
