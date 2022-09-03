import 'package:flutter/material.dart';
import 'package:pacman_game/screens/map_render/map_render.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return const MapRender();
              }),
              (route) => false,
            );
          },
          child: const Text('INICIAR'),
        ),
      ),
    );
  }
}