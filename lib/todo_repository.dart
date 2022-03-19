import 'package:amplify_flutter/amplify_flutter.dart';

import 'models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isDone: false);
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodoIsDone(Todo todo, bool isDone) async {
    final updatedTodo = todo.copyWith(isDone: isDone);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }
}
