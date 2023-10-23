
import '../models/todo.dart';
import '../services/todo_api.dart';

class TodoRepository {
  final TodoApi todoApi;
  TodoRepository(this.todoApi);

  Future<List<Todo>> getAllTodos() async {
    final todos = await todoApi.getTodos();
    return todos.map((e) => Todo.fromJson(e)).toList();
  }

  Future<String> deleteTodo(String id) async {
    final deletedId = await todoApi.deleteTodo(id);
    return deletedId;
  }

  Future<void> addTodo(String todo) async {
    await todoApi.addTodo(todo);
  }

  Future<void> updateTodo(Todo todo)async{
    await todoApi.updateTodo(todo);
  }

}
