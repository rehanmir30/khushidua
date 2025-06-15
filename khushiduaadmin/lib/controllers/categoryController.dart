import 'dart:html';

import 'package:get/get.dart';
import 'package:khushiduaadmin/models/subCategoryModel.dart';
import 'package:khushiduaadmin/services/categoryService.dart';

import '../models/categoryModel.dart';

class CategoryController extends GetxController {
  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  List<SubCategoryModel> _allSubCategories=[];
  List<SubCategoryModel> get allSubCategories=>_allSubCategories;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  setLoading(bool value){
    _isLoading=value;
    update();
  }

   createCategory(CategoryModel categoryModel,  File catLogo) async{
    await CategoryService().createCategory(categoryModel,catLogo);
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

  getAllCategories() {
    CategoryService().getAllCategories();
   }

   updateCategory(CategoryModel categoryModel, File? catLogo) async{
    await CategoryService().updateCategory(categoryModel,catLogo);
   }

   Future<List<SubCategoryModel>>getSubCategories(CategoryModel categoryModel) async{
     List<SubCategoryModel>allSubCategories=await CategoryService().getSubCategories(categoryModel);
     return allSubCategories;
   }

   createSubCategory(SubCategoryModel subCategoryModel,File image) async{
    await CategoryService().createSubCategory(subCategoryModel,image);
   }

   getAllSubCategories() {
     CategoryService().getAllSubCategories();
   }


}
