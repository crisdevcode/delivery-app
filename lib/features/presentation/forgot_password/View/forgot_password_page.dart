import 'package:flutter/material.dart';
// Common Widgets
import 'package:delivery/features/presentation/common_widgets/back_button.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';

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
              headerText('Recuperar contraseña', Theme.of(context).primaryColor,
                  FontWeight.bold, 30.0),
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
              _buttonSend(context)
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

Widget _buttonSend(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: const EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
      onPressed: () {
        // Success Alert Modal
        _showForgotAlert(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // text
        backgroundColor: Theme.of(context).colorScheme.secondary, // bg
        shape: const StadiumBorder(),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: const Text('Enviar',
          style: TextStyle(color: Colors.white, fontSize: 15.0)),
    ),
  );
}

void _showForgotAlert(BuildContext context) {
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
                  const Image(
                    image: AssetImage('assets/lock.png'),
                    width: 130,
                    height: 130,
                  ),
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: headerText(
                          "Tu contraseña ha sido restablecida",
                          Theme.of(context).primaryColor,
                          FontWeight.bold,
                          20.0)),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(
                        "En breve recibirás un correo electrónico con un código para establecer una nueva contraseña.",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  _buttonDone(context)
                ],
              ),
            ));
      });
}

Widget _buttonDone(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: const EdgeInsets.only(top: 40.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // text
        backgroundColor: Theme.of(context).colorScheme.secondary, // bg
        shape: const StadiumBorder(),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: const Text('¡Hecho!',
          style: TextStyle(color: Colors.white, fontSize: 17.0)),
    ),
  );
}
