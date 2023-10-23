import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/todos_cubit.dart';
import '../../screens/base/input_decoration.dart';
import '../../screens/base/reusable_button.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../data/repositories/todo_repository.dart';
import '../../data/services/todo_api.dart';
import '../root.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();

  final todoController = TextEditingController();
  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
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
            title: const Text(Labels.addTodo)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    controller: todoController,
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

                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<TodosCubit, TodosState>(
                    builder: (context, state) {

                      return ReusableButton(
                          onPressed: () async{
                          if(formKey.currentState!.validate()){
                            BlocProvider.of<TodosCubit>(context)
                                .addTodo(todoController.text);

                          }
                          },
                          child: state is TodosAreLoading
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : const Text("Add Todo"));

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
