import 'package:flutter/material.dart';
import 'dart:core';

import '../Item.dart';

class ManageFav extends ChangeNotifier {

  bool isFav = false;
  int lengthCard = 6;

  Map<int,bool> mapFavCard = new Map();

  List<Item> listCard;

  ManageFav() {

    listCard = [];

    for (int i = 0; i < lengthCard; i++) {
      mapFavCard[i] = false;
    }

  }

  addFav(int index) {
    listCard.add(Item(index));
    mapFavCard[index] = !mapFavCard[index];
    notifyListeners();
  }

  removeFav(int index) {
    print(index);
    listCard.removeWhere((element) => element.index == index);
    mapFavCard[index] = !mapFavCard[index];
    notifyListeners();
  }

  bool get getIsFav => isFav;
  Map<int,bool> get getMapFavCard => mapFavCard;
  int get getLengthCard => lengthCard;
  List<Item> get getListCart => listCard;
}