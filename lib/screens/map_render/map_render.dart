import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/widgets/player/player.dart';

class MapRender extends StatelessWidget {
  const MapRender({Key? key}) : super(key: key);

  final double tileSize = 32;

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
          size: 100,
          isFixed: true,
        ),
      ),
      map: WorldMapByTiled('map/pacmap.json',
          forceTileSize: Vector2(tileSize, tileSize)),
      lightingColorGame: Colors.black.withOpacity(0.15),
      player: GamePlayer(position: Vector2(25 * tileSize, 20 * tileSize)),
    );
  }
}
