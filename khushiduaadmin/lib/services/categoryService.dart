import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/constants/firebaseRef.dart';
import 'package:khushiduaadmin/controllers/categoryController.dart';
import 'package:khushiduaadmin/models/categoryModel.dart';
import 'package:khushiduaadmin/models/subCategoryModel.dart';

import '../widgets/customSnackbar.dart';

class CategoryService {
  CategoryController _categoryController = Get.find<CategoryController>();

  createCategory(CategoryModel categoryModel, File catLogo) async {
    _categoryController.setLoading(true);
    categoryModel.id = categoryRef.doc().id;
    try {
      // categoryModel.image = (await uploadFileToFirebase(catImage, "${categoryModel.id}/categoryImage"))!;
      categoryModel.logo = (await uploadFileToFirebase(catLogo, "${categoryModel.id}/categoryLogo"))!;

      await categoryRef.doc(categoryModel.id).set(categoryModel.toMap());
      _categoryController.setLoading(false);
      Get.back();
      CustomSnackbar.show("Success", "Category added successfully");
      return true;
    } catch (e) {
      CustomSnackbar.show("Error", "Something went wrong", isSuccess: false);
      _categoryController.setLoading(false);
      return false;
    }
  }

  Future<String?> uploadFileToFirebase(File file, String path) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(path);

      final uploadTask = storageRef.putBlob(file);

      final snapshot = await uploadTask.whenComplete(() {});

      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }

  getAllCategories() async {
    categoryRef.snapshots().listen((event) {
      event.docChanges.forEach((element) {
        if (element.type == DocumentChangeType.added || element.type == DocumentChangeType.modified) {
          _categoryController.addCategoryToList(CategoryModel.fromMap(element.doc.data()!));
        }
      });
    });
  }

  updateCategory(CategoryModel categoryModel, File? catLogo) async {
    _categoryController.setLoading(true);

    try {
      // if (catImage != null) {
      //   // categoryModel.image = (await uploadFileToFirebase(catImage, "${categoryModel.id}/categoryImage"))!;
      // }
      if (catLogo != null) {
        categoryModel.logo = (await uploadFileToFirebase(catLogo, "${categoryModel.id}/categoryLogo"))!;
      }
      await categoryRef.doc(categoryModel.id).update(categoryModel.toMap());
      _categoryController.setLoading(false);
      Get.back();
      CustomSnackbar.show("Success", "Category updated successfully");
    } catch (e) {
      CustomSnackbar.show("Error", "Something went wrong", isSuccess: false);
      _categoryController.setLoading(false);
      return false;
    }
  }

  Future<List<SubCategoryModel>> getSubCategories(CategoryModel categoryModel) async {
    try {
      _categoryController.setLoading(true);
      final snapshot = await subCategoryRef
          .where("categoryId",isEqualTo: categoryModel.id)
          .orderBy("order")
          .get();

      final List<SubCategoryModel> subCategories = snapshot.docs.map((doc) {
        final data = doc.data();
        return SubCategoryModel.fromMap(data);
      }).toList();

      print("✅ Subcategories fetched: ${subCategories.length}");
      return subCategories;
    } catch (e, stack) {
      print("❌ ERROR in getSubCategories: $e");
      print("📍 StackTrace: $stack");
      return [];
    } finally {
      _categoryController.setLoading(false);
    }
  }


  createSubCategory(SubCategoryModel subCategoryModel,File catImage) async {
    _categoryController.setLoading(true);
    subCategoryModel.id = subCategoryRef.doc().id;
    if (catImage != null) {
      subCategoryModel.image = (await uploadFileToFirebase(catImage, "${subCategoryModel.id}/subCategoryImage"))!;
    }
    await subCategoryRef.doc(subCategoryModel.id).set(subCategoryModel.toMap());
    _categoryController.setLoading(false);
    Get.back();
    Get.back();
    Get.back();
    CustomSnackbar.show("Success", "Sub Category created successfully");
  }

   getAllSubCategories() {
     subCategoryRef.snapshots().listen((event) {
       event.docChanges.forEach((element) {
         if (element.type == DocumentChangeType.added || element.type == DocumentChangeType.modified) {
           _categoryController.addSubCategoryToList(SubCategoryModel.fromMap(element.doc.data()!));
         }
       });
     });
   }

  editSubCategory(SubCategoryModel subCategoryModel, image) async{
    if(image!=null){
      subCategoryModel.image = (await uploadFileToFirebase(image, "${subCategoryModel.id}/subCategoryImage"))!;
    }
    await subCategoryRef.doc(subCategoryModel.id).update(subCategoryModel.toMap());
    Get.back();
    Get.back();

    CustomSnackbar.show("Success", "Sub Category updated successfully");
  }
}
