import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  bool isEnglish=true;
  Locale locale=  Locale("en");

  changeLanguage(){
  isEnglish=!isEnglish;
  locale=isEnglish ?  const Locale("en"): const Locale("er");
  notifyListeners();
  }

}