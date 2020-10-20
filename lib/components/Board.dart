import 'dart:ui';

import 'package:Ronda/components/GameCard.dart';
import 'package:Ronda/components/Player.dart';

class Board {
  List<GameCard> cards;
  final game;

  double cardPosX = 0;
  double cardPosY;
  double cardWidth;
  double cardHeight;

  Board(this.game) {
    cards = List<GameCard>();
    cardWidth = game.screenSize.width / 5;
    cardHeight = game.screenSize.height / 5;
    cardPosY = game.screenSize.height / 2 - cardHeight / 2;
  }

  void render(Canvas canvas) {
    cards.forEach((card) {
      card.cardRect = Rect.fromLTWH(cards.indexOf(card) * cardWidth, cardPosY, cardWidth, cardHeight);
      card.render(canvas);
    });
  }

  void playCard(GameCard card, Player player) {
    List<GameCard> found = List<GameCard>();
    cards.forEach((boardCard) {
      if (card.value == boardCard.value) {
        found.add(boardCard);
      }
    });
    if (found.isEmpty) {
      cards.add(card);
    }
    found.forEach((card) {
      cards.remove(card);
      player.score += 1;
    });
  }

  void update(double t) {
  }
}