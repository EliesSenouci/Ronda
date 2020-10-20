import 'dart:ui';
import 'package:Ronda/CoreGame.dart';
import 'package:flame/sprite.dart';

class Result {
  final CoreGame game;
  Rect titleRect;
  Sprite titleSprite;

  Result(this.game) {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 6),
      game.tileSize * 7,
      game.tileSize * 6,
    );
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {
    if (game.victory == true) {
      titleSprite = Sprite('UI/win.png');
    }
    else {
      titleSprite = Sprite('UI/loose.png');
    }
  }
}