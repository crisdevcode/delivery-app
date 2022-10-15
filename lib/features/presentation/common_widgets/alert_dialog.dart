import 'package:flutter/material.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';

void showAlertDialog(
    BuildContext context,
    ImageProvider<Object> imagePath,
    String headerTitle,
    String headerSubTitle,
    String labelButton,
    Widget buttonDone) {
  showDialog(
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
                          headerTitle,
                          Theme.of(context).primaryColor,
                          FontWeight.bold,
                          20.0)),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(headerSubTitle,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  buttonDone
                ],
              ),
            ));
      });
}
