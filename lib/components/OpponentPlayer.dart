import 'package:Ronda/components/Player.dart';

class OpponentPlayer extends Player {
  OpponentPlayer(game) : super(game) {
    cardPosY = -cardHeight / 2;
  }
}