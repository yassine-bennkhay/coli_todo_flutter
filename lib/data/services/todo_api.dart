import 'package:dio/dio.dart';
import '../../constants/strings.dart';

import '../models/todo.dart';

class TodoApi {
  late Dio dio;

  TodoApi() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getTodos() async {
    try {
      Response response = await dio.get(todosEndpoint);

      return response.data;
    } catch (e) {
      return [];
    }
  }

  Future<String> deleteTodo(String id) async {
    try {
      Response response = await dio.delete("$todosEndpoint/$id");
      final Map<String, dynamic> responseData = response.data;
      final String deletedId = responseData["id"];
      return deletedId;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo(String todo) async {
    try {
      await dio.post(todosEndpoint, data: {
        "task": todo,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodo(Todo todo)async{
    try{
      print("********************");

      print(todo.status);
      print(todo.task);
      print("********************");
      await dio.put("$todosEndpoint/${todo.id}",data: {
        "task":todo.task,
        "status":todo.status.name,
      });
    }catch(e){
      rethrow;
    }
  }
}
