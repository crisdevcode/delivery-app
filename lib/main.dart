import 'package:delivery/base/Views/base_view.dart';
import 'package:delivery/features/presentation/StateProviders/error_state_provider.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Routes
import 'package:delivery/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
      ChangeNotifierProvider(create: (_) => LoadingStateProvider())
    ], child: MyAppUserState());
  }
}

class MyAppUserState extends StatelessWidget with BaseView {
  MyAppUserState({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coordinator.start(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MyApp(initialRoute: snapshot.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;
  const MyApp({super.key, required String initialRoute})
      : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: _initialRoute,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black))));
  }
}
