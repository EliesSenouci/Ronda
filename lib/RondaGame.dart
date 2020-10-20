import 'dart:ui';

import 'package:Ronda/CoreGame.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/GameCard.dart';
import 'components/Deck.dart';
import 'components/Player.dart';
import 'components/Board.dart';

class RondaGame {
  final game;
  Deck deck;
  int round = 0;
  Player player;
  Board board;

  RondaGame(this.game) {
    initCards();
    if (player == null) {
      player = new Player(game);
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
    deck = new Deck(game);
    board = Board(game);
    board.takeCard(dealCard());
    board.takeCard(dealCard());
    board.takeCard(dealCard());
  }

  void render(Canvas canvas) {
    board.render(canvas);
    player.render(canvas);

  }

  void update(double t) {
    player.cards.forEach((element) {element.update(t);});
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