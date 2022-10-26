import 'package:flutter/material.dart';
import 'authentication/splash.dart';
import 'home/home.dart';
import 'login/loginpage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        'splash': (context) => const SplashPage(),
        'login': (context) => LoginPage(),
        'home': (context) => const Home(),
      },
    );
  }
}
