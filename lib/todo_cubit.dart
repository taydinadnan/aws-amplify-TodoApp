import 'package:awsamplifydeneme/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/Todo.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  final List<Todo>? todos;

  ListTodosSuccess({this.todos});
}

class ListTodosFailure extends TodoState {
  final Exception? exception;

  ListTodosFailure({this.exception});
}

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();

  TodoCubit() : super(LoadingTodos());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure());
    }
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    getTodos();
  }

  void updateTodoIsComplete(Todo todo, bool isDone) async {
    await _todoRepo.updateTodoIsDone(todo, isDone);
    getTodos();
  }
}
