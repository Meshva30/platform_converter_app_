import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier{
  bool isActive =false;

  void isChangeSwitch (bool value){
    isActive=value;
    notifyListeners();
  }
}