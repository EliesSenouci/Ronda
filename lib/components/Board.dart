import 'dart:ui';

import 'package:Ronda/components/GameCard.dart';
import 'package:Ronda/components/OpponentPlayer.dart';
import 'package:Ronda/components/Player.dart';
import 'package:flame/flame.dart';

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
    cardPosY = game.screenSize.height / 2 - cardHeight;
  }

  void render(Canvas canvas) {
    cards.forEach((card) {
      if (cards.indexOf(card) < 3) {
        card.cardRect = Rect.fromLTWH(cards.indexOf(card) * cardWidth + cardWidth, cardPosY, cardWidth, cardHeight);
      }
      else if (cards.indexOf(card) < 6) {
        card.cardRect = Rect.fromLTWH((cards.indexOf(card) * cardWidth + cardWidth) - 3 * cardWidth, cardPosY + cardHeight, cardWidth, cardHeight);
      }
      else if (cards.indexOf(card) == 6) {
        card.cardRect = Rect.fromLTWH(0, cardPosY, cardWidth, cardHeight);
      }
      else if (cards.indexOf(card) == 7) {
        card.cardRect = Rect.fromLTWH(game.screenSize.width - cardWidth, cardPosY, cardWidth, cardHeight);
      }
      else if (cards.indexOf(card) == 8) {
        card.cardRect = Rect.fromLTWH(0, cardPosY + cardHeight, cardWidth, cardHeight);
      }
      else if (cards.indexOf(card) == 9) {
        card.cardRect = Rect.fromLTWH(game.screenSize.width - cardWidth, cardPosY + cardHeight, cardWidth, cardHeight);
      }
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
    else {
      if (player is OpponentPlayer == false) {
        //Flame.audio.play("sfx/win.mp3");
      }
      player.score += 1;
      found.forEach((card) {
        cards.remove(card);
        player.score += 1;
      });

    }
  }

  void update(double t) {
    cards.forEach((card) {
      card.visible = true;
      card.update(t);
    });
  }
}