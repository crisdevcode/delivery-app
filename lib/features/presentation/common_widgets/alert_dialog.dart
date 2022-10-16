import 'package:flutter/material.dart';
// Headers
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
// Colors
import 'package:delivery/colors/colors.dart';

Future showAlertDialog(BuildContext context, ImageProvider<Object> imagePath,
    String headerTitle, String headerSubTitle, Widget buttonDone) async {
  await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 400,
              child: Column(
                children: <Widget>[
                  Image(
                    image: imagePath,
                    width: 130,
                    height: 130,
                  ),
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: headerText(
                          text: headerTitle,
                          color: colorPrimary,
                          fontSize: 20.0)),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(headerSubTitle,
                        style: const TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  buttonDone
                ],
              ),
            ));
      });
}
