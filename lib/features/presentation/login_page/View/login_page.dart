import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:delivery/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: <Widget>[
            const Image(
              width: double.infinity,
              height: 350.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: backButton(context, Colors.white),
            )
          ],
        ),
        Transform.translate(
          offset: const Offset(0.0, -20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    const Text("Bienvenid@",
                        style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                    const Text("Ingresa con tu cuenta",
                        style: TextStyle(
                            color: colorGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0)),
                    _emailInput(),
                    _passwordInput(),
                    roundedButton(
                        labelButton: "Iniciar sesión",
                        color: colorOrange,
                        func: () {
                          Navigator.pushNamed(context, 'tabs');
                        }),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'forgot-password');
                        },
                        child: const Text('¿Olvidaste tu contraseña?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0)),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿No tienes una cuenta?',
                                style: TextStyle(
                                    color: colorGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'sign-up');
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Text('Registrate aquí',
                                    style: TextStyle(
                                        color: colorOrange,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0)),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
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

Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
