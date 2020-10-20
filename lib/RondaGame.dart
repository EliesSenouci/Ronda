import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/GameCard.dart';
import 'components/Deck.dart';
import 'components/Player.dart';
import 'components/Board.dart';

class RondaGame {
  final coreGame;

  Deck deck;
  Player player;
  Board board;

  RondaGame(this.coreGame) {
    initCards();
    if (player == null) {
      player = new Player(coreGame);
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
    deck = new Deck(coreGame);
    board = Board(coreGame);
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
    int playedCard = -1;
    player.cards.forEach((GameCard card) {
      if (card.cardRect.contains(d.globalPosition)) {
        card.onTapDown();
        board.takeCard(card);
        playedCard = player.cards.indexOf(card);
      }
    });
    if (playedCard != -1) {
      player.cards.removeAt(playedCard);
    }
  }
}