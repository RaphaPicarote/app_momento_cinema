import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:momento_cinema/authentication/spash_controller.dart';
import 'package:momento_cinema/authentication/splash_states.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      controller.isAuthenticated().then((value) {
        if (value is SplashStateAuthenticated) {
          Navigator.of(context).pushReplacementNamed('home');
        } else {
          Navigator.of(context).pushReplacementNamed('login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(94, 0, 0, 236),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_cbrbre30.json',
                  width: 200),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Momento Cinema',
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'CutiveMono',
                      color: Colors.white),
                ),
                //TODO: MUDAR A FONTE
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ));
  }
}
