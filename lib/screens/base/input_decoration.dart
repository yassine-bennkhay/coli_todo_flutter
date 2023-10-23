import 'package:flutter/material.dart';

import '../../constants/colors.dart';

InputDecoration customInputDecoration(
  IconData iconData,
  String hintText,
) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide:
          BorderSide(color: Color.fromARGB(255, 233, 232, 232), width: 1),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1),
    ),

    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color:Colors.redAccent , width: 1),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color:Colors.redAccent , width: 1),
    ) ,
    filled: true,
    prefixIcon: Icon(
      iconData,
      color: Colors.black38,
    ),
    hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
    hintText: hintText,
    fillColor: const Color(0xFFF5F9FA),
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
  );
}
