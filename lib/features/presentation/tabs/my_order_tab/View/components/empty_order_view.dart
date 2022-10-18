import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgGray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: colorWhite,
        title: headerText(
            text: 'Mi pedido',
            color: colorPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  width: 216,
                  height: 216,
                  image: AssetImage('assets/emptyOrder.png')),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: headerText(
                    text: 'Carrito vacio',
                    color: colorGray,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: headerText(
                    text:
                        'Good food is always cooking! Go ahead, order some yummy items from the menu.',
                    textAlign: TextAlign.center,
                    color: colorGray,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
