import 'package:flutter/material.dart';
import 'package:app_without_name/constants.dart';
import 'package:flutter/services.dart';
import 'route.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routing',
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: SplashViewRoute,
    );
  }
}
