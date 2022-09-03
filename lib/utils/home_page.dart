import 'package:flutter/material.dart';
import 'package:pacman_game/screens/map_render/map_render.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'BEM VINDO A ',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              Text(
                'SUHIRO!',
                style: TextStyle(fontSize: 35, color: Colors.orange),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.orange.shade400)),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                  return const MapRender();
                }),
                (route) => false,
              );
            },
            child: const Text(
              'INICIAR AVENTURA',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Feito com ❤️ por Erilândio Santos Medeiros',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      )),
    );
  }
}
