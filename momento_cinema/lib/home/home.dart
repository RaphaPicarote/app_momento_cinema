import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contHeight = size.height * 0.25;
    final contWidth = size.width * 2;

    return Scaffold(
        backgroundColor: Color.fromARGB(199, 27, 27, 139),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Momento Cinema',
            style: TextStyle(),
          ),
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              //height: contHeight,
              child: ClipRRect(
                child: Stack(children: [
                  Image.network(
                      'https://i.postimg.cc/fRnJvLG5/128617133-759302747995768-1815977027398640022-n.jpg',
                      fit: BoxFit.contain),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: contWidth,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Assista agora!')),
                    ],
                  )
                ]),
              ),
            ),
          ],
        )));
  }
}
