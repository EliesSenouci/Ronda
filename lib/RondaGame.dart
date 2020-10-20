import 'dart:io';
import 'dart:math';
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

  int turn = 0;

  RondaGame(this.coreGame) {
    initCards();
  }

  GameCard dealCard() {
    GameCard card = deck.deck.last;
    deck.deck.removeLast();
    return card;
  }

  void initCards() {
    deck = new Deck(coreGame);
    board = Board(coreGame);
    board.cards.add(dealCard());
    board.cards.add(dealCard());
    board.cards.add(dealCard());
    board.cards.add(dealCard());
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

  void render(Canvas canvas) {
    board.render(canvas);
    player.render(canvas);
    opponent.render(canvas);

  }

  void update(double t) {
    player.cards.forEach((element) {element.update(t);});
    opponent.cards.forEach((element) {element.update(t);});
    if (player.cards.isEmpty && opponent.cards.isEmpty) {
      player.takeCard(dealCard());
      player.takeCard(dealCard());
      player.takeCard(dealCard());
      opponent.takeCard(dealCard());
      opponent.takeCard(dealCard());
      opponent.takeCard(dealCard());

    }
  }

  void onTapDown(TapDownDetails d) {
    if (turn == 0) {
      playerTurn(d, player);
    }
    if (turn == 1) {
      Random rnd = new Random();
      int r = 0 + rnd.nextInt(opponent.cards.length - 0);
      board.playCard(opponent.cards[r], player);
      opponent.cards.removeAt(r);
      endTurn();
    }
  }

  void playerTurn(TapDownDetails d, Player player) {
    int playedCard = -1;
    player.cards.forEach((GameCard card) {
      if (card.cardRect.contains(d.globalPosition)) {
        board.playCard(card, player);
        playedCard = player.cards.indexOf(card);
        endTurn();
      }
    });
    if (playedCard != -1) {
      player.cards.removeAt(playedCard);
    }
  }

  void endTurn() {
    if (turn == 0) {
      turn = 1;
    }
    else {
      turn = 0;
    }
  }
}