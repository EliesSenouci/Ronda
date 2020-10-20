import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/GameCard.dart';
import 'components/Deck.dart';
import 'components/Player.dart';
import 'components/Board.dart';

class RondaGame extends Game {

  Size screenSize;
  double tileSize;
  Deck deck;
  int round = 0;
  Player player;
  Board board;

  RondaGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    initCards();
    if (player == null) {
      player = new Player(this);
      player.takeCard(dealCard());
      player.takeCard(dealCard());
      player.takeCard(dealCard());
    }
  }

  GameCard dealCard() {
    GameCard card = deck.deck.last;
    deck.deck.removeLast();
    return card;
  }

  void initCards() {
    deck = new Deck(this);
    board = Board(this);
    //board.takeCard(dealCard());
    board.takeCard(dealCard());
    board.takeCard(dealCard());
    board.takeCard(dealCard());
  }

  @override
  void render(Canvas canvas) {
    drawBackground(canvas);
    board.render(canvas);
    player.render(canvas);

  }

  void drawBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {
    player.cards.forEach((element) {element.update(t);});
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

  }

  void onTapDown(TapDownDetails d) {
    player.cards.forEach((GameCard card) {
      if (card.cardRect.contains(d.globalPosition)) {
        card.onTapDown();
        board.takeCard(card);
      }
    });
  }
}