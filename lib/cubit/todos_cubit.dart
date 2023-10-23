

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repositories/todo_repository.dart';

import '../data/models/todo.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  List<Todo> todos = [];
  final TodoRepository todoRepository;
  TodosCubit(this.todoRepository) : super(TodosInitial());
  List<Todo> getAllTodos() {
    emit(TodosAreLoading());
    todoRepository.getAllTodos().then((todos) {
      emit(TodosAreLoaded(todos));
      this.todos = todos;
    });
    return todos;
  }

  void deleteTodo(String id) async {
    final deletedId = await todoRepository.deleteTodo(id);
    todos.removeWhere((todo) => todo.id == deletedId);
    emit(TodosAreLoaded(todos));
  }

  Future<void> addTodo(String todo) async {
emit(TodosAreLoading());
    await todoRepository.addTodo(todo);
    emit(TodosAreLoaded(todos));
  }

  Future<void> updateTodo(Todo todo)async{
    emit(TodosAreLoading());
    await todoRepository.updateTodo(todo);
    emit(TodosAreLoaded(todos));
  }
}
