import 'package:Ronda/components/GameCard.dart';
import 'package:flame/game.dart';

class Deck {
  List<GameCard> deck;
  final game;

  Deck(this.game) {
    deck = List<GameCard>();

    deck.add(GameCard(game, 1, "heart"));
    deck.add(GameCard(game, 2, "heart"));
    deck.add(GameCard(game, 3, "heart"));
    deck.add(GameCard(game, 4, "heart"));
    deck.add(GameCard(game, 5, "heart"));
    deck.add(GameCard(game, 6, "heart"));
    deck.add(GameCard(game, 7, "heart"));
    deck.add(GameCard(game, 8, "heart"));
    deck.add(GameCard(game, 9, "heart"));
    deck.add(GameCard(game, 10, "heart"));
    deck.add(GameCard(game, 11, "heart"));
    deck.add(GameCard(game, 12, "heart"));
    deck.add(GameCard(game, 13, "heart"));

    deck.add(GameCard(game, 1, "spade"));
    deck.add(GameCard(game, 2, "spade"));
    deck.add(GameCard(game, 3, "spade"));
    deck.add(GameCard(game, 4, "spade"));
    deck.add(GameCard(game, 5, "spade"));
    deck.add(GameCard(game, 6, "spade"));
    deck.add(GameCard(game, 7, "spade"));
    deck.add(GameCard(game, 8, "spade"));
    deck.add(GameCard(game, 9, "spade"));
    deck.add(GameCard(game, 10, "spade"));
    deck.add(GameCard(game, 11, "spade"));
    deck.add(GameCard(game, 12, "spade"));
    deck.add(GameCard(game, 13, "spade"));

    deck.add(GameCard(game, 1, "clover"));
    deck.add(GameCard(game, 2, "clover"));
    deck.add(GameCard(game, 3, "clover"));
    deck.add(GameCard(game, 4, "clover"));
    deck.add(GameCard(game, 5, "clover"));
    deck.add(GameCard(game, 6, "clover"));
    deck.add(GameCard(game, 7, "clover"));
    deck.add(GameCard(game, 8, "clover"));
    deck.add(GameCard(game, 9, "clover"));
    deck.add(GameCard(game, 10, "clover"));
    deck.add(GameCard(game, 11, "clover"));
    deck.add(GameCard(game, 12, "clover"));
    deck.add(GameCard(game, 13, "clover"));

    deck.add(GameCard(game, 1, "diamond"));
    deck.add(GameCard(game, 2, "diamond"));
    deck.add(GameCard(game, 3, "diamond"));
    deck.add(GameCard(game, 4, "diamond"));
    deck.add(GameCard(game, 5, "diamond"));
    deck.add(GameCard(game, 6, "diamond"));
    deck.add(GameCard(game, 7, "diamond"));
    deck.add(GameCard(game, 8, "diamond"));
    deck.add(GameCard(game, 9, "diamond"));
    deck.add(GameCard(game, 10, "diamond"));
    deck.add(GameCard(game, 11, "diamond"));
    deck.add(GameCard(game, 12, "diamond"));
    deck.add(GameCard(game, 13, "diamond"));

    deck.shuffle();
  }
}