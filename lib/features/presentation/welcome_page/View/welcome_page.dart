import 'dart:ui';

import 'package:delivery/features/presentation/login_page/View/login_page.dart';
import 'package:flutter/material.dart';

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
              child: const Text('DELIVERED FAST FOOD TO YOUR DOOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0)),
            ),
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

            //! FIX THIS
            // Buttons
            Container(
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
                child: const Text('Iniciar Sesión', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
                )),
              ),
            ),
            
            Container(
              width: 350.0,
              height: 45.0,
              margin: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  print('click');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary, // text
                  backgroundColor: Theme.of(context).colorScheme.primary, // bg
                  shape: const StadiumBorder(),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   [
                     const Image(
                      image: NetworkImage('https://cdn-icons-png.flaticon.com/512/733/733547.png'),
                      width: 20.0,
                      height: 20.0,
                    ),
                     Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: const Text('Conectar con Facebook', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
