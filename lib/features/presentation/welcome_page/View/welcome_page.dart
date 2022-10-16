import 'package:flutter/material.dart';
// UI
import 'dart:ui';
// Colors
import 'package:delivery/colors/colors.dart';
// Common Widgets
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: headerText(
                    text: 'DELIVERED FAST FOOD TO YOUR DOOR',
                    color: Colors.white,
                    fontSize: 45.0)),
            // Description
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: const Text(
                  'Desayuno, almuerzo, cena y mucho más, entregado de forma segura en su puerta.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0)),
            ),
            // Buttons
            // Login with email
            roundedButton(
                labelButton: 'Iniciar Sesión',
                color: colorOrange,
                func: () {
                  Navigator.pushNamed(context, 'login');
                }),
            // Login with facebook
            roundedButton(
                labelButton: "Conectar con Facebook",
                color: colorFbButton,
                isWithIcon: true,
                icon: const AssetImage('assets/facebook.png'),
                func: () {
                  print('Login facebook');
                })
          ],
        )
      ],
    ));
  }
}

/**
 * Container(
              width: 350.0,
              height: 45.0,
              margin: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimary, // text
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary, // bg
                  shape: const StadiumBorder(),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                child: const Text(,
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
            ),
 */