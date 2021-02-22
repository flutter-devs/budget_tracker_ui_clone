
import 'package:budget_tracker_ui_clone/routing/router.dart';
import 'package:budget_tracker_ui_clone/routing/routes.dart';
import 'package:budget_tracker_ui_clone/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: Routes.SplashRoute,
    );
  }
}
