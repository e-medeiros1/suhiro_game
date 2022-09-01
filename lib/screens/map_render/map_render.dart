import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/player/player.dart';

class MapRender extends StatelessWidget {
  const MapRender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = BasicValues.TILE_SIZE;
    return BonfireWidget(
      // showCollisionArea: true,
      cameraConfig: CameraConfig(
        smoothCameraEnabled: true,
        moveOnlyMapArea: true,
        zoom: 2.3,
        sizeMovementWindow: Vector2(
          tileSize * 3,
          tileSize * 3,
        ),
      ),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(
          size: 110,
          isFixed: true,
          color: Colors.blueGrey.shade800,
        ),
      ),
      map: WorldMapByTiled(
        'map/pacmap.json',
        objectsBuilder: {
          'necro': (properties) => NecroEnemy(
                position: properties.position,
              ),
        },
      ),
      player: GamePlayer(
        position: Vector2(25 * tileSize, 20 * tileSize),
      ),
    );
  }
}
