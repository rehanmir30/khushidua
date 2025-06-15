import 'dart:html';

import 'package:get/get.dart';
import 'package:khushiduaadmin/services/duaService.dart';

import '../models/duaModel.dart';

class DuaController extends GetxController {
  List<DuaModel> _allDuas = [];
  List<DuaModel> get allDuas => _allDuas;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  setLoading(bool value){
    _isLoading=value;
    update();
  }

  getAllDuas() {
    DuaService().getAllDuas();
  }

  addDuaToList(DuaModel duaModel) {
    int existingIndex = _allDuas.indexWhere((cat) => cat.id == duaModel.id);

    if (existingIndex == -1) {
      _allDuas.add(duaModel);
    } else {
      _allDuas[existingIndex] = duaModel;
    }
    _allDuas.sort((a, b) => a.order.compareTo(b.order));
    update();
  }

  createDua(DuaModel duaModel, File duaImage, File grownUpmp3File, File littleKidmp3File, File olderKidmp3File) {
    DuaService().createDua(duaModel,duaImage,grownUpmp3File,littleKidmp3File,olderKidmp3File);
  }
}
