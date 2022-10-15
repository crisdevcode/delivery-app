import 'package:flutter/material.dart';

Widget doneButton(BuildContext context, String labelButton) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: const EdgeInsets.only(top: 40.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "login");
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // text
        backgroundColor: Theme.of(context).colorScheme.secondary, // bg
        shape: const StadiumBorder(),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: Text(labelButton,
          style: const TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}
