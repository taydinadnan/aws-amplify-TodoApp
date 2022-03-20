import 'package:amplify_flutter/amplify_flutter.dart';

import 'models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos(String userId) async {
    try {
      final todos = await Amplify.DataStore.query(
        Todo.classType,
        where: Todo.USERID.eq(userId),
      );
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title, String userId) async {
    final newTodo = Todo(
      title: title,
      isDone: false,
      userId: userId,
    );
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    final updatedTodo = todo.copyWith(isDone: isComplete);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }

  Stream observeTodos() {
    return Amplify.DataStore.observe(Todo.classType);
  }
}
