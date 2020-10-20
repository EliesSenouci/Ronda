import 'package:Ronda/RondaGame.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CoreGame.dart';

void main() {
  CoreGame game = new CoreGame();
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  Flame.images.loadAll(<String>[
    "Cards/card_1_clover.png",
    "Cards/card_2_clover.png",
    "Cards/card_3_clover.png",
    "Cards/card_4_clover.png",
    "Cards/card_5_clover.png",
    "Cards/card_6_clover.png",
    "Cards/card_7_clover.png",
    "Cards/card_8_clover.png",
    "Cards/card_9_clover.png",
    "Cards/card_10_clover.png",
    "Cards/card_11_clover.png",
    "Cards/card_12_clover.png",
    "Cards/card_13_clover.png",
    "Cards/card_1_diamond.png",
    "Cards/card_2_diamond.png",
    "Cards/card_3_diamond.png",
    "Cards/card_4_diamond.png",
    "Cards/card_5_diamond.png",
    "Cards/card_6_diamond.png",
    "Cards/card_7_diamond.png",
    "Cards/card_8_diamond.png",
    "Cards/card_9_diamond.png",
    "Cards/card_10_diamond.png",
    "Cards/card_11_diamond.png",
    "Cards/card_12_diamond.png",
    "Cards/card_13_diamond.png",
    "Cards/card_1_heart.png",
    "Cards/card_2_heart.png",
    "Cards/card_3_heart.png",
    "Cards/card_4_heart.png",
    "Cards/card_5_heart.png",
    "Cards/card_6_heart.png",
    "Cards/card_7_heart.png",
    "Cards/card_8_heart.png",
    "Cards/card_9_heart.png",
    "Cards/card_10_heart.png",
    "Cards/card_11_heart.png",
    "Cards/card_12_heart.png",
    "Cards/card_13_heart.png",
    "Cards/card_1_spade.png",
    "Cards/card_2_spade.png",
    "Cards/card_3_spade.png",
    "Cards/card_4_spade.png",
    "Cards/card_5_spade.png",
    "Cards/card_6_spade.png",
    "Cards/card_7_spade.png",
    "Cards/card_8_spade.png",
    "Cards/card_9_spade.png",
    "Cards/card_10_spade.png",
    "Cards/card_11_spade.png",
    "Cards/card_12_spade.png",
    "Cards/card_13_spade.png"
  ]);
}