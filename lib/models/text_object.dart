import 'package:assignment/models/text_color.dart';
import 'package:flutter/material.dart';

import '../assets/constants.dart';

class TextObject {
  Offset _position = Offset(0, 0);
  TextColor _textColor = TextColor(label: 'Black', color: Colors.black);
  String _text = "Text";
  double _fontSize = 15;
  String _fontFamily = Roboto;

  Offset get position => _position;
  TextColor get textColor => _textColor;
  String get text => _text;
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  set textColor(TextColor textColor) => _textColor = textColor;
  set text(String text) => _text = text;
  set fontSize(double fontSize) => _fontSize = fontSize;
  set fontFamily(String fontFamily) => _fontFamily = fontFamily;
  set position(Offset postion) => _position = postion;

  TextObject({
    required double screenWidth,
    required double screenHeight,
  });
}
