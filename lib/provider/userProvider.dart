import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  bool _expand = false;

  bool get expand => _expand;


   setExpand (bool value){
    _expand = value;
    notifyListeners();
  }
}