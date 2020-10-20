import 'dart:ui';
import 'package:Ronda/CoreGame.dart';
import 'package:Ronda/view.dart';
import 'package:flame/sprite.dart';

class StartButton {
  final CoreGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 4,
    );
    sprite = Sprite('UI/play.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.playing;
  }
}