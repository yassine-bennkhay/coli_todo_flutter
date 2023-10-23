import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/todos_cubit.dart';
import '../../screens/base/input_decoration.dart';
import '../../screens/base/reusable_button.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../data/models/todo.dart';
import '../../data/repositories/todo_repository.dart';
import '../../data/services/todo_api.dart';
import '../root.dart';

class EditTodo extends StatefulWidget {
 final Todo todo;
   const EditTodo(this.todo,{super.key});

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final formKey = GlobalKey<FormState>();

  final todoController = TextEditingController();
  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }
@override
  void initState() {
  todoController.text = widget.todo.task;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(TodoRepository(TodoApi())),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(Labels.editTodo),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: todoController,
                  onChanged: (newTask) {
                    widget.todo.task = newTask;
                  },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please add a todo";
                      }
                      return null;
                    },
                    decoration: customInputDecoration(
                      Icons.add,
                      "Add a Todo",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<Status>(
                    value: widget.todo.status,
                    items: Status.values
                        .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status.name),
                    ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        widget.todo.status = newValue!;
                      });
                    },
                    decoration: customInputDecoration(Icons.info, ""),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<TodosCubit, TodosState>(
                    builder: (context, state) {
                      return ReusableButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<TodosCubit>(context)
                                .updateTodo(widget.todo);

                          }
                        },
                        child: state is TodosAreLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text("Update Todo"),
                      );
                    },
                  ),

                  BlocListener<TodosCubit, TodosState>(
                    listener: (context, state) {
                      if (state is TodosAreLoaded) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Root(),
                        ));

                      }
                    },
                    child: SizedBox(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
