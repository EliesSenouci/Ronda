import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Cards/GameCard.dart';

class RondaGame extends Game {

  Size screenSize;
  List<GameCard> cards;

  RondaGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    cards = List<GameCard>();
    initCards();
  }

  void initCards() {
    cards.add(GameCard(this));
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    cards.forEach((GameCard card) => card.render(canvas));
  }

  @override
  void update(double t) {
    cards.forEach((element) {element.update(t);});
  }

  void resize(Size size) {
    screenSize = size;
  }

  void onTapDown(TapDownDetails d) {
    cards.forEach((GameCard card) {
      if (card.cardRect.contains(d.globalPosition)) {
        card.onTapDown();
      }
    });
  }
}