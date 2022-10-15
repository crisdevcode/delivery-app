import 'package:flutter/material.dart';

// Pages
import 'package:delivery/features/presentation/welcome_page/View/welcome_page.dart';
import 'package:delivery/features/presentation/login_page/View/login_page.dart';
import 'package:delivery/features/presentation/forgot_password/View/forgot_password_page.dart';
import 'package:delivery/features/presentation/sign_up_page/View/sign_up_page.dart';
import 'package:delivery/features/presentation/tabs/tabs_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
  'login': (BuildContext context) => const LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sign-up': (BuildContext context) => const SignUpPage(),
  'tabs': (BuildContext context) => const TabsPage(),
  
};