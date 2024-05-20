import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier{
  bool isActive =false;

 void isChange (bool value){
   isActive=value;
   notifyListeners();
 }
}

