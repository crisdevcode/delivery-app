import 'package:flutter/material.dart';
// Colors
import 'package:delivery/colors/colors.dart';
// Common Widgets
import 'package:delivery/features/presentation/common_widgets/back_button.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/rounded_button.dart';
import 'package:delivery/features/presentation/common_widgets/alert_dialog.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              headerText(
                  'Recuperar contraseña', colorPrimary, FontWeight.bold, 30.0),
              Container(
                padding: const EdgeInsets.all(6.0),
                child: const Text(
                    'Introduzca su dirección de correo electrónico. Recibirá un enlace para crear una nueva contraseña.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              _emailInput(),
              roundedButton(
                  labelButton: 'Enviar',
                  color: colorOrange,
                  func: () {
                    _showForgotAlert(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Correo electrónico',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

void _showForgotAlert(BuildContext context) {
  showAlertDialog(
      context,
      const AssetImage('assets/lock.png'),
      "Tu contraseña ha sido restablecida",
      "En breve recibirás un correo electrónico con un código para establecer una nueva contraseña.",
      roundedButton(
          labelButton: "Listo",
          color: colorOrange,
          func: () {
            Navigator.pushNamed(context, 'login');
          }));
}
