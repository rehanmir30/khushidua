import 'package:get/get.dart';

class ThemeController extends GetxController{

  int _selectedAgeGroup=0;

  int get selectedAgeGroup=>_selectedAgeGroup;

  double _textSize=20;
  double get textSize=>_textSize;

  bool _showTranslation=true;
  bool get showTranslation=>_showTranslation;

  bool _showTransliteration=false;
  bool get showTransliteration=>_showTransliteration;

  setShowTransliteration(bool value){
    _showTransliteration=value;
    update();
  }

  setShowTranslation(bool value){
    _showTranslation=value;
    update();
  }


  setTextSize(double   value){
    _textSize=value;
    update();
  }


  setSelectedAgeGroup(int value){
    _selectedAgeGroup=value;
    update();
  }

}