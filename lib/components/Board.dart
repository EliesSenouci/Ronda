import 'dart:ui';

import 'package:Ronda/components/GameCard.dart';

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
      card.render(canvas);
    });
  }

  void takeCard(GameCard card) {
    double posX = cardWidth * cards.length;
    card.cardRect = Rect.fromLTWH(posX, cardPosY, cardWidth, cardHeight);
    cards.add(card);
  }

  void update(double t) {
  }
}