import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';

class CoreGame extends Game {

  Size screenSize;
  double tileSize;

  CoreGame() {
    initialize();

  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    drawBackground(canvas);
  }

  void drawBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }
  @override
  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

  }

  get onTapDown => null;

}