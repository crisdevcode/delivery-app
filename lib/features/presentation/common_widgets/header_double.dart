import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
import 'package:flutter/material.dart';

Widget headerDoubleText(
    {String? textHeader, String? textAction, Function? func}) {
  return Container(
    child: Row(
      children: [
        headerText(text: textHeader!, fontSize: 20.0),
        const Spacer(),
        GestureDetector(
          onTap: () {
            //func!();
          },
          child: headerText(
              text: textAction!,
              color: colorOrange,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    ),
  );
}
