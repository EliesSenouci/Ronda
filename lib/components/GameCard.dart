import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class GameCard {
  final game;

  int value;
  String type;
  bool visible = true;

  Sprite cardSprite;
  Rect cardRect;
  double width;
  double height;
  double posX;
  double posY;

  bool touched = false;
  Offset targetLocation;
  double get speed => game.tileSize * 50;

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
    if (!visible) {
      cardSprite = Sprite("Cards/back.png");
    }
    else {
      cardSprite = Sprite("Cards/card_" + value.toString() + "_" + type + ".png");
    }
  }

  void onTapDown() {

  }
}