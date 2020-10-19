import 'package:Ronda/RondaGame.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  RondaGame game = new RondaGame();
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  Flame.images.loadAll(<String>[
    'Cards/Clover/card_1_clover.png',
  ]);

  }