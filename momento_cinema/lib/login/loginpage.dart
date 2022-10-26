import 'package:flutter/material.dart';
import 'package:momento_cinema/login/login_controller.dart';
import 'package:momento_cinema/login/login_states.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  LoginPage({Key? key}) : super(key: key);
  final controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Center(
          child: Container(
            width: 500,
            height: 400,
            decoration: BoxDecoration(
                color: const Color.fromARGB(200, 253, 253, 253),
                borderRadius: BorderRadius.circular(15.0)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Momento Cinema',
                        style: TextStyle(
                            fontFamily: 'FrederickatheGreat', fontSize: 30),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Email obrigatorio';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Email '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Senha'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          final navigator = Navigator.of(context);
                          if (_formKey.currentState?.validate() ?? false) {
                            final result = await controller.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (result is LoginStateError) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Material(
                                    child: Center(
                                      child: Text(result.error),
                                    ),
                                  );
                                },
                              );
                            }
                            if (result is LoginStateSuccess) {
                              navigator.pushReplacementNamed('home');
                            }
                          }
                        },
                        child: const Text('Entrar')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(
                      height: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Fazer login com:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const CircleBorder(),
                          ),
                          child: const Image(
                            image: NetworkImage(
                                'https://i.postimg.cc/ryfsDS3c/682665-favicon-google-logo-new-icon.png'),
                            width: 25,
                          ),
                        ),
                        const Text('ou'),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: const CircleBorder(),
                            ),
                            child: const Image(
                              image: NetworkImage(
                                  'https://i.postimg.cc/nrsSx4NZ/5296499-fb-facebook-facebook-logo-icon.png'),
                              width: 25,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
