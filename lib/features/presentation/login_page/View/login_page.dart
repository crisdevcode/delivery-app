import 'package:delivery/base/Views/base_view.dart';
import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';
import 'package:delivery/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:delivery/features/presentation/common_widgets/TexFormFields/custom_text_form_field.dart';
import 'package:delivery/features/presentation/login_page/ViewModel/login_view_model.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BaseView {
  // * Dependencies
  final LoginViewModel _viewModel;

  LoginPage({super.key, LoginViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {
    // Inicializar ViewModel
    _viewModel.initState(
        loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Stack(
                      children: const [
                        Image(
                            width: double.infinity,
                            height: 350.0,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0.0, -20.0),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Form(
                              key: _viewModel.formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  const Text("Welcome Back",
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0)),
                                  const Text("Login to you account",
                                      style: TextStyle(
                                          color: colorGray,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0)),
                                  CustomTextFormField(
                                      textFormFieldType:
                                          CustomTextFormFieldType.email,
                                      hintext: 'Email',
                                      delegate: _viewModel),
                                  CustomTextFormField(
                                      textFormFieldType:
                                          CustomTextFormFieldType.password,
                                      hintext: 'Password',
                                      delegate: _viewModel),
                                  roundedButton(
                                      context: context,
                                      color: colorOrange,
                                      labelButton: 'Log in',
                                      func: () {
                                        _ctaButtonTapped(context);
                                      }),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'forgot-password');
                                      },
                                      child: const Text('Forgot you password?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17.0)),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Don't have an account?",
                                            style: TextStyle(
                                                color: colorGray,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0)),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'sign-up');
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: const Text('Sign up',
                                                style: TextStyle(
                                                    color: colorOrange,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]))
            ],
          ));
  }
}

extension UserActions on LoginPage {
  void _ctaButtonTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel
          .login(
              email: _viewModel.loginModel?.email ?? "",
              password: _viewModel.loginModel?.password ?? "")
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'tabs');
            break;
          case ResultStatus.error:
            if (result.error != null) {
              errorStateProvider.setFailure(
                  context: context, value: result.error!);
            }
            break;
        }
      });
    }
  }
}
