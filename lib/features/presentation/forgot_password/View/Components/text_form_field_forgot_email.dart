import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/forgot_password/ViewModel/forgot_password_view_model.dart';
import 'package:delivery/utils/Validators/form_validators.dart';
import 'package:flutter/material.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;
  const TextFormFieldEmailUpdatePassword({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: colorBgInput, borderRadius: BorderRadius.circular(40.0)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Correo electrónico',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        validator: (value) =>
            EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (newValue) => viewModel.email = newValue,
      ),
    );
  }
}
