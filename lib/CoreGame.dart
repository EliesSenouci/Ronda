import 'dart:ui';

import 'package:Ronda/RondaGame.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';

class CoreGame extends Game {

  Size screenSize;
  double tileSize;
  RondaGame rondaGame;
  CoreGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    rondaGame = RondaGame(this);
  }

  @override
  void render(Canvas canvas) {
    drawBackground(canvas);
    rondaGame.render(canvas);
  }

  void drawBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }
  @override
  void update(double t) {
    rondaGame.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

  }

  void onTapDown(TapDownDetails d) {
    rondaGame.onTapDown(d);
  }

}