import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Cards/GameCard.dart';
import 'Deck.dart';

class RondaGame extends Game {

  Size screenSize;
  double tileSize;
  Deck deck;
  List<GameCard> cards;

  RondaGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    initCards();
  }

  void initCards() {
    cards = List<GameCard>();
    deck = new Deck(this);
    cards.add(deck.deck.last);
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
    tileSize = screenSize.width / 9;

  }

  void onTapDown(TapDownDetails d) {
    cards.forEach((GameCard card) {
      if (card.cardRect.contains(d.globalPosition)) {
        card.onTapDown();
      }
    });
  }
}