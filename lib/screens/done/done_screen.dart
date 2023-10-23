import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../cubit/todos_cubit.dart';
import '../../screens/todo/widgets/shimmer_todo_widget.dart';
import '../../screens/base/todo_widget.dart';

import '../../constants/images.dart';
import '../../data/models/todo.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
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
          itemCount:
          todoTasks!.where((todo) => todo.status == Status.done).length,
          itemBuilder: (context, index) {
            return TodoWidget(todoTasks!
                .where((todo) => todo.status == Status.done)
                .toList()[index]);
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
            const Text("You haven't done much Today! get to work.")
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
            body: todoTasks!
                .where((todo) => todo.status == Status.done)
                .toList()
                .isEmpty
                ? noTodosYet()
                : buildTodoListView(),
          );
        } else {
          return const ShimmerTodoWidget();
        }
      },
    );
  }
}
