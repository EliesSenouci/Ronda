import 'dart:ui';

import 'package:Ronda/components/OpponentPlayer.dart';
import 'package:flutter/material.dart';

import 'components/GameCard.dart';
import 'components/Deck.dart';
import 'components/Player.dart';
import 'components/Board.dart';

class RondaGame {
  final coreGame;

  Deck deck;
  Player player;
  OpponentPlayer opponent;
  Board board;

  RondaGame(this.coreGame) {
    initCards();
    if (player == null) {
      player = new Player(coreGame);
      player.takeCard(dealCard());
      player.takeCard(dealCard());
      player.takeCard(dealCard());
    }

    if (opponent == null) {
      opponent = new OpponentPlayer(coreGame);
      opponent.takeCard(dealCard());
      opponent.takeCard(dealCard());
      opponent.takeCard(dealCard());
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
    opponent.render(canvas);

  }

  void update(double t) {
    player.cards.forEach((element) {element.update(t);});
    opponent.cards.forEach((element) {element.update(t);});
  }

  void onTapDown(TapDownDetails d) {
    playerTurn(d, player);
    playerTurn(d, opponent);
  }

  void playerTurn(TapDownDetails d, Player player) {
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