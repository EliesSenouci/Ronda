import 'dart:ui';

import 'GameCard.dart';

class Player {
  List<GameCard> cards;
  final game;

  Player(this.game) {
    cards = List<GameCard>();
  }

  void takeCard(GameCard card) {
    if (cards.length < 3) {
      cards.add(card);
      if (cards.length == 1) {
        card.cardRect = Rect.fromLTWH(card.posX - card.width, card.posY, game.screenSize.width / 3, game.screenSize.height / 3);
      }
      if (cards.length == 2) {
        card.cardRect = Rect.fromLTWH(card.posX, card.posY, game.screenSize.width / 3, game.screenSize.height / 3);
      }
      if (cards.length == 3) {
        card.cardRect = Rect.fromLTWH(card.posX + card.width, card.posY, game.screenSize.width / 3, game.screenSize.height / 3);
      }
    }
  }

  void render(Canvas canvas) {
    cards.forEach((element) {element.render(canvas);});
  }
}