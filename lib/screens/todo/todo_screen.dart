import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../cubit/todos_cubit.dart';
import '../../screens/base/custom_page_route.dart';
import '../../screens/todo/add_todo.dart';
import '../../screens/todo/widgets/shimmer_todo_widget.dart';
import '../../screens/base/todo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/images.dart';
import '../../data/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo>? todoTasks = [];

  @override
  void initState() {
    super.initState();
    todoTasks = BlocProvider.of<TodosCubit>(context).getAllTodos();

  }

  Widget buildTodoListView() {
    return RefreshIndicator(
      strokeWidth: 2,
      color: Colors.white,
      backgroundColor: AppColors.kPrimaryColor,
      onRefresh: () async {
        BlocProvider.of<TodosCubit>(context).getAllTodos();
      },
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: todoTasks!.where((todo) => todo.status==Status.todo).length,
          itemBuilder: (context, index) {
            return TodoWidget(todoTasks!.where((todo) => todo.status==Status.todo).toList()[index]);
          }),
    );
  }

  Widget noTodosYet() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Images.nothing,
          height: 60,
          width: 60,
        ),
        const Text("No ToDos yet, start adding some.")
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      builder: (context, state) {
        if (state is TodosAreLoaded) {
          todoTasks = state.todos;
          return Scaffold(
            body:  todoTasks!.where((todo) => todo.status==Status.todo).toList().isEmpty ? noTodosYet() : buildTodoListView(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(customPageRoute(const AddTodo()));


              },
              child: const Icon(Icons.add),
            ),
          );
        } else {
          return const ShimmerTodoWidget();
        }
      },
    );
  }
}
