import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTodoWidget extends StatelessWidget {
  const ShimmerTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
       return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
        decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
        ),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 60,
        ));
      }
    );
  }
}
