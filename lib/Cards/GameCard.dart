import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class GameCard {
  final game;
  int value;
  String type;
  double width;
  double height;
  double posX;
  double posY;
  Rect cardRect;
  bool touched = false;
  Offset targetLocation;
  double get speed => game.tileSize * 15;
  Sprite cardSprite;

  GameCard(this.game, int value, String type) {
    width = game.screenSize.width / 3;
    height = game.screenSize.height / 3;
    posX = game.screenSize.width / 2 - width / 2;
    posY = game.screenSize.height - height / 2;
    this.value = value;
    this.type = type;
    this.cardSprite = Sprite("Cards/card_" + value.toString() + "_" + type + ".png");
    cardRect = Rect.fromLTWH(posX, posY, width, height);
  }

  void render(Canvas canvas) {
    cardSprite.renderRect(canvas, cardRect.inflate(2));
  }

  void update(double t) {
    if (touched == true) {
      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(cardRect.left, cardRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        cardRect = cardRect.shift(stepToTarget);
      } else {
        cardRect = cardRect.shift(toTarget);
      }

    }
  }

  void onTapDown() {
    touched = true;
    double x = game.screenSize.width / 2 - width / 2;
    double y = game.screenSize.height / 2 - height / 2;
    targetLocation = Offset(x, y);

  }
}