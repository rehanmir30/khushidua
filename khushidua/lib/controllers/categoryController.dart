import 'package:get/get.dart';

import '../models/categoryModel.dart';
import '../models/subCategoryModel.dart';
import '../services/categoryService.dart';

class CategoryController extends GetxController {
  List<CategoryModel> _allCategories = [];
  List<SubCategoryModel> _allSubCategories = [];
  List<SubCategoryModel> _filteredSubCategories = [];

  List<CategoryModel> get allCategories => _allCategories;

  List<SubCategoryModel> get allSubCategories => _allSubCategories;

  List<SubCategoryModel> get filteredSubCategories => _filteredSubCategories;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    update();
  }

  getAllCategories() {
    CategoryService().getAllCategories();
  }

  getAllSubCategories() {
    CategoryService().getAllSubCategories();
  }

  addCategoryToList(CategoryModel categoryModel) {
    int existingIndex = _allCategories.indexWhere((cat) => cat.id == categoryModel.id);

    if (existingIndex == -1) {
      _allCategories.add(categoryModel);
    } else {
      _allCategories[existingIndex] = categoryModel;
    }
    _allCategories.sort((a, b) => a.order.compareTo(b.order));
    update();
  }

  addSubCategoryToList(SubCategoryModel subCategoryModel) {
    int existingIndex = _allSubCategories.indexWhere((cat) => cat.id == subCategoryModel.id);

    if (existingIndex == -1) {
      _allSubCategories.add(subCategoryModel);
    } else {
      _allSubCategories[existingIndex] = subCategoryModel;
    }
    _allSubCategories.sort((a, b) => a.order.compareTo(b.order));
    update();
  }

  getSubCategories(CategoryModel categoryModel) {
    // print(categoryModel.id);
    // print(_allSubCategories.length);
    _filteredSubCategories.clear();
    _filteredSubCategories = _allSubCategories.where((element) => element.categoryId == categoryModel.id).toList();
    // for (var item in _allSubCategories) {
    //   print(item.categoryId);
    //   if (item.categoryId == categoryModel.id) {
    //     _filteredSubCategories.add(item);
    //   }
    // }
    // print(_filteredSubCategories.length);
    update();
  }
}
