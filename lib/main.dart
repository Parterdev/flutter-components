import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
