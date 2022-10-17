import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
import 'package:flutter/material.dart';

class ListTileCheck extends StatelessWidget {
  String text;
  bool isActive;
  Function func;

  ListTileCheck(
      {super.key,
      required this.text,
      required this.isActive,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        listTiles(context: context, text: text, isActive: isActive, func: func)
      ],
    );
  }
}

Widget listTiles(
    {required BuildContext context,
    required String text,
    required bool isActive,
    required Function func}) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      onTap: () {
        func();
      },
      title: headerText(
          text: text,
          color: isActive ? colorOrange : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 17.0),
      trailing: isActive
          ? Icon(
              Icons.check,
              color: isActive ? colorOrange : Colors.black,
            )
          : const Text(''),
    ),
  );
}
