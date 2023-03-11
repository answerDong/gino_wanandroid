import 'package:flutter/cupertino.dart';

//收藏状态监听
class FavoriteProvider with ChangeNotifier {

  bool _isFavorite = false;

  FavoriteProvider();

  void ChangeFavorite(bool isFavorite) {
    _isFavorite = isFavorite;
    notifyListeners();
  }
}