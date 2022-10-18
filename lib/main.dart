import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Routes
import 'package:delivery/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: 'welcome',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black))));
  }
}
