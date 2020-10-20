import 'dart:ui';

import 'package:Ronda/RondaGame.dart';
import 'package:Ronda/view.dart';
import 'package:Ronda/views/home-view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';

import 'components/StartButton.dart';

class CoreGame extends Game {

  Size screenSize;
  double tileSize;
  RondaGame rondaGame;
  HomeView homeView;
  View activeView = View.home;
  StartButton startButton;
  CoreGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    homeView = HomeView(this);
    startButton = StartButton(this);
  }

  @override
  void render(Canvas canvas) {
    drawBackground(canvas);
    if (activeView == View.home) {
      homeView.render(canvas);
      startButton.render(canvas);
    }
    else if (activeView == View.playing) {
      rondaGame.render(canvas);
    }
  }

  void drawBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {
    if (activeView == View.playing) {
      rondaGame.update(t);
    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

  }

  void onTapDown(TapDownDetails d) {
    if (startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home) {
        startButton.onTapDown();
        rondaGame = RondaGame(this);
      }
    }
    if (activeView == View.playing) {
      rondaGame.onTapDown(d);
    }
  }

}