import 'package:delivery/features/presentation/forgot_password/View/Components/text_form_field_forgot_email.dart';
import 'package:delivery/features/presentation/forgot_password/ViewModel/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
// Colors
import 'package:delivery/colors/colors.dart';
// Common Widgets
import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:delivery/features/presentation/common_widgets/Alerts/alert_dialog.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Dependencias
  final ForgotPasswordViewModel viewModel;

  _ForgotPasswordState({ForgotPasswordViewModel? forgotPasswordViewModel})
      : viewModel = forgotPasswordViewModel ?? DefaultForgotPasswordViewModel();

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
                  text: 'Recuperar contraseña',
                  color: colorPrimary,
                  fontSize: 20.0),
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
              TextFormFieldEmailUpdatePassword(viewModel: viewModel),
              roundedButton(
                  labelButton: 'Enviar',
                  color: colorOrange,
                  func: () {
                    _ctaButtonTapped(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped(BuildContext context) {
    viewModel.updatePassword().then((value) {
      showAlertDialog(
          context,
          const AssetImage('assets/lock.png'),
          "Tu contraseña ha sido restablecida",
          "En breve recibirás un correo electrónico con un código para establecer una nueva contraseña.",
          roundedButton(
              context: context,
              labelButton: 'Listo',
              color: colorOrange,
              func: () {
                Navigator.pushNamed(context, 'login');
              }));
    });
  }
}
