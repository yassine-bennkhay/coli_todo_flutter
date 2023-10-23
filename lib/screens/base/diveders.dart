import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget Diveders(String text){
  return      Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
        width: 100,

        child: Divider(color: AppColors.kPrimaryColor,thickness: 1,),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text),
      ),
      const SizedBox(
        width: 100,
        child: Divider(color: AppColors.kPrimaryColor,thickness: 1,),
      ),
    ],
  );
}
