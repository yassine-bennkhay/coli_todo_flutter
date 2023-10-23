import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/strings.dart';
import '../../cubit/todos_cubit.dart';
import '../../screens/base/custom_page_route.dart';
import '../../screens/todo/edit_todo.dart';
import '../../screens/todo_details/todo_details.dart';

import '../../data/models/todo.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget(this.todo, {super.key});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(customPageRoute(TodoDetails(todo)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)
          ],
        ),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(8),
        width: 200,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(todo.task, overflow: TextOverflow.ellipsis),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                    size: 20.0,
                  ),
                  onPressed: () {

                    Navigator.of(context).push(customPageRoute(EditTodo(todo)));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline,
                      color: Colors.red, size: 20.0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text(Labels.confirmTitle),
                          content: const Text(Labels.confirmContent),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop(); // Close the dialog
                              },
                              child: const Text(Labels.cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<TodosCubit>(context).deleteTodo(todo.id);
                                Navigator.of(dialogContext).pop();
                              },
                              child: const Text(Labels.delete),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
