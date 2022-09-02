import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/decoration/board.dart';
import 'package:pacman_game/widgets/decoration/bonfire.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/player/player.dart';

class MapRender extends StatelessWidget {
  const MapRender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = BasicValues.TILE_SIZE;
    return BonfireWidget(
//Camera
      cameraConfig: CameraConfig(
        smoothCameraEnabled: true,
        moveOnlyMapArea: true,
        zoom: 2.3,
        sizeMovementWindow: Vector2(tileSize * 5, tileSize * 5),
      ),
//Joystic
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(
          size: 110,
          isFixed: true,
          color: Colors.blueGrey.shade800,
        ),
      ),
//Map Render
      map: WorldMapByTiled(
        'map/pacmap.json',
        objectsBuilder: {
          'necro': (properties) => NecroEnemy(position: properties.position),
          'bonfire': (properties) => Lamp(position: properties.position),
          'coin': (properties) => Coins(position: properties.position),
          'board': (properties) => Board(position: properties.position),
        },
      ),
//Player
      player: GamePlayer(
        position: Vector2(tileSize * 25, tileSize * 20),
      ),
//Lighting
      lightingColorGame: Colors.black.withOpacity(0.15),
    );
  }
}
