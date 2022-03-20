import 'package:amplify_auth_cognito/amplify_auth_cognito_stream_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Todo.dart';
import '../todo_repository.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  final List<Todo> todos;

  ListTodosSuccess({required this.todos});
}

class ListTodosFailure extends TodoState {
  final Exception? exception;

  ListTodosFailure({this.exception});
}

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();
  final String userId;

  TodoCubit({required this.userId}) : super(LoadingTodos());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos(userId);
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure());
    }
  }

  void observeTodo() {
    final todosStream = _todoRepo.observeTodos();
    todosStream.listen((_) => getTodos());
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title, userId);
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
  }
}
