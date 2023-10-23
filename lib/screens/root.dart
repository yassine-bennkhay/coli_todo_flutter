import 'package:colicoli_todo/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


import '../constants/images.dart';
import '../constants/strings.dart';
import '../cubit/todos_cubit.dart';
import '../data/repositories/todo_repository.dart';
import '../data/services/todo_api.dart';
import 'done/done_screen.dart';
import 'in_progress/in_prgoress_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;
  void onBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = <Widget>[
    const TodoScreen(),
    const InProgressScreen(),
    const DoneScreen(),
  ];

  List<String> appBarTitles = [
    "Todos",
    "In Progress",
    "Done",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(TodoRepository(TodoApi())),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff363853),
            elevation: 0,
            centerTitle: true,
            title: Text(
              appBarTitles.elementAt(selectedIndex),
            )),
        body: screens.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.todo), label: Labels.todo),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.inPorgress),
                label: Labels.inProgress),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.done), label: Labels.done),
          ],
          currentIndex: selectedIndex,
          onTap: onBarTapped,
          selectedItemColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
