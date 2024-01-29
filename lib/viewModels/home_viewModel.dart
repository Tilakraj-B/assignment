import 'package:flutter/material.dart';

import '../models/text_object.dart';

class HomePageViewModel with ChangeNotifier {
  List<TextObject> _listTextObject = [];

  List<TextObject> get listTextObject => _listTextObject;

  HomePageViewModel(
      {required double screenWidth, required double screenHeight}) {
    addTextObject(screenWidth: screenWidth, screenHeight: screenHeight);
  }

  void addTextObject(
      {required double screenWidth, required double screenHeight}) {
    _listTextObject
        .add(TextObject(screenWidth: screenWidth, screenHeight: screenHeight));
    print(listTextObject.length);
  }
}
