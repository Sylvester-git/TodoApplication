import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<Todo> createTodo(Session session, Todo todo) async {
    final createdtodo = await Todo.db.insertRow(session, todo);
    return createdtodo;
  }

  Future<List<Todo>> getAllTodo(Session session) async {
    final authsession = await session.authenticated;
    final userid = authsession?.userId;
    if (userid == null) {
      throw Exception('Unauthorized user access');
    }
    final todos = await Todo.db
        .find(session, where: (todo) => todo.userID.equals(userid));
    return todos;
  }

  Future<Todo> updateTodo(Session session, Todo todo) async {
    if (todo.id == null) {
      throw Exception('No ID found');
    }
    final updatedTodo = await Todo.db.updateRow(session, todo);
    return updatedTodo;
  }

  Future<Todo> deleteTodo(Session session, Todo todo) async {
    if (todo.id == null) {
      throw Exception('No ID found');
    }
    final result = await Todo.db.deleteRow(session, todo);
    return result;
  }
}
