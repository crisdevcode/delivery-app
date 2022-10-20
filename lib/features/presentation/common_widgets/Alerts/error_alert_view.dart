import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog(
      {required BuildContext context,
      required String subtitle,
      dynamic Function()? ctaButtonAction}) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SizedBox(
              height: 320,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/error-icon.png'),
                    width: 130,
                    height: 130,
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text('Error',
                        style: TextStyle(color: colorPrimary, fontSize: 20.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: Text(subtitle,
                        style: const TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  roundedButton(
                      context: context,
                      labelButton: 'Ir a inicio',
                      color: colorOrange,
                      func: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          );
        });
  }
}
