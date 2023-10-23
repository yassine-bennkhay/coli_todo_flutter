import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../data/models/todo.dart';
import '../base/diveders.dart';
class TodoDetails extends StatelessWidget {
  final Todo todo;
  const TodoDetails(this.todo,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(Labels.todoDetails),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)
          ],
        ),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
        padding: const EdgeInsets.all(8),

        width: double.infinity,
       height: double.infinity,
        child: Column(

          children: [
Diveders(todo.status.name),
            Text(todo.task),
            Spacer(),
            Diveders(todo.createdAt.split('T')[0].toString()),
          ],
        ),
      ),
    );
  }
}
