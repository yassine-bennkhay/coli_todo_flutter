part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosAreLoading extends TodosState {}

class TodosAreLoaded extends TodosState {
  final List<Todo> todos;
  TodosAreLoaded(this.todos);
}
