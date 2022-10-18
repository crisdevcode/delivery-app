import 'package:flutter/material.dart';

Widget roundedButton({
  BuildContext? context,
  double width = 350.0,
  double height = 45.0,
  bool isWithIcon = false,
  ImageProvider<Object>? icon,
  required String labelButton,
  required Color color,
  required Function func,
}) {
  return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 15.0),
      child: isWithIcon
          ? _elevatedButtonWithIcon(icon!, labelButton, color, func)
          : _elevatedButtonNotIcon(labelButton, color, func));
}

Widget _elevatedButtonWithIcon(ImageProvider<Object> icon, String labelButton,
    Color color, Function func) {
  return ElevatedButton(
    onPressed: () {
      func();
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // text
      backgroundColor: color, // bg
      shape: const StadiumBorder(),
    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: icon,
          width: 20.0,
          height: 20.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(labelButton,
              style: const TextStyle(color: Colors.white, fontSize: 15.0)),
        )
      ],
    ),
  );
}

Widget _elevatedButtonNotIcon(String labelButton, Color color, Function func) {
  return ElevatedButton(
    onPressed: () {
      func();
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // text
      backgroundColor: color, // bg
      shape: const StadiumBorder(),
    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(labelButton,
              style: const TextStyle(color: Colors.white, fontSize: 15.0)),
        )
      ],
    ),
  );
}
