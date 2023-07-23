

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:orchidapos/presntation/home/home_ui.dart';
import 'package:orchidapos/presntation/login/view/login_view.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
   // _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      // debugShowCheckedModeBanner: false,
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
      // theme: getApplicationTheme(),
      home: HomePage(),
    );
  }
}
