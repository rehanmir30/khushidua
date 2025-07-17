import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/constants/firebaseRef.dart';
import 'package:khushiduaadmin/controllers/categoryController.dart';
import 'package:khushiduaadmin/models/categoryModel.dart';
import 'package:khushiduaadmin/views/category/editCategory.dart';
import 'package:khushiduaadmin/widgets/topBar.dart';

import '../../constants/colors.dart';
import '../category/createNew.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBlack,
      body: GetBuilder<CategoryController>(
        builder: (categoryController) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(title: "Categories"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 125,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: rBg),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xff955C00), shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: SvgPicture.asset("assets/svgs/coins.svg"),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TweenAnimationBuilder<int>(
                                  tween: IntTween(begin: 0, end: categoryController.allCategories.length),
                                  duration: Duration(seconds: 2),
                                  builder: (context, value, child) {
                                    return Text(
                                      _formatNumber(value),
                                      style: TextStyle(color: rWhite, fontWeight: FontWeight.bold, fontSize: 30),
                                    );
                                  },
                                ),
                                Text(
                                  "Total Categories",
                                  style: TextStyle(color: rWhite, fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ).marginOnly(left: 12)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 125,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: rBg),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xff883232), shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: SvgPicture.asset("assets/svgs/coins.svg"),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("${coinController.allCoins.length??0}",style: TextStyle(color: rWhite,fontWeight: FontWeight.bold,fontSize: 30),),
                                TweenAnimationBuilder<int>(
                                  tween: IntTween(
                                      begin: 0, end: categoryController.allCategories.where((element) => element.isEnabled == false).toList().length),
                                  duration: Duration(seconds: 1),
                                  builder: (context, value, child) {
                                    return Text(
                                      _formatNumber(value),
                                      style: TextStyle(color: rWhite, fontWeight: FontWeight.bold, fontSize: 30),
                                    );
                                  },
                                ),
                                Text(
                                  "Disabled Categories",
                                  style: TextStyle(color: rWhite, fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ).marginOnly(left: 12)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 125,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: rBg),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xff008A3F), shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: SvgPicture.asset("assets/svgs/coins.svg"),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("3,450",style: TextStyle(color: rWhite,fontWeight: FontWeight.bold,fontSize: 30),),
                                TweenAnimationBuilder<int>(
                                  tween: IntTween(
                                      begin: 0, end: categoryController.allCategories.where((element) => element.isEnabled == true).toList().length),
                                  duration: Duration(seconds: 1),
                                  builder: (context, value, child) {
                                    return Text(
                                      _formatNumber(value),
                                      style: TextStyle(color: rWhite, fontWeight: FontWeight.bold, fontSize: 30),
                                    );
                                  },
                                ),
                                Text(
                                  "Enabled Categories",
                                  style: TextStyle(color: rWhite, fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ).marginOnly(left: 12)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Container())
                  ],
                ).marginOnly(top: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Categories",
                      style: TextStyle(color: rWhite, fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.to(CreateNewCategory(), transition: Transition.upToDown);
                      },
                      child: Container(
                        decoration: BoxDecoration(color: rGreen, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/svgs/add.svg"),
                            Text(
                              "Create a new Category",
                              style: TextStyle(color: rWhite),
                            ).marginOnly(left: 8)
                          ],
                        ).marginAll(12),
                      ),
                    )
                  ],
                ).marginOnly(top: 12),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: rBg),
                  child: Column(
                    children: [
                      TableHeader(),
                      Theme(
                        data: Theme.of(context).copyWith(
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                        child: ReorderableListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          onReorder: (oldIndex, newIndex) async {
                            if (newIndex > oldIndex) newIndex -= 1;
            
                            final movedCategory = categoryController.allCategories.removeAt(oldIndex);
                            categoryController.allCategories.insert(newIndex, movedCategory);
            
                            for (int i = 0; i < categoryController.allCategories.length; i++) {
                              final category = categoryController.allCategories[i];
                              await categoryRef.doc(category.id).update({"order": i});
                            }
                          },
                          children: [
                            for (int index = 0; index < categoryController.allCategories.length; index++)
                              CategoryTile(
                                categoryController.allCategories[index],
                                key: ValueKey(categoryController.allCategories[index].id),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ).marginSymmetric(horizontal: 12, vertical: 12),
          );
        },
      ),
    );
  }
}

Widget TableHeader() {
  return Container(
    decoration: BoxDecoration(
      color: rWhite.withOpacity(0.05),
    ),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "ID",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Order",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 2,
            child: Text(
              "Logo",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 2,
            child: Text(
              "Title",
              style: TextStyle(color: rHint, fontWeight: FontWeight.bold),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Status",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Action",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
      ],
    ).marginSymmetric(horizontal: 12, vertical: 10),
  );
}

class CategoryTile extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryTile(this.categoryModel, {super.key});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "${"${widget.categoryModel.id.substring(0, 5)}..."}",
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "${"${widget.categoryModel.order}"}",
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "${widget.categoryModel.logo}",
                  width: 40,
                  height: 40,
                ),
              ],
            )),
        Expanded(
            flex: 2,
            child: Text(
              "${widget.categoryModel.english}",
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 1,
            child: Text(
              widget.categoryModel.isEnabled ? "Enabled" : "Disabled",
              style: TextStyle(color: widget.categoryModel.isEnabled ? rGreen : rRed, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Get.to(EditCategory(model: widget.categoryModel));
              },
              child: Align(alignment: Alignment.centerLeft, child: SvgPicture.asset("assets/svgs/eye.svg")),
            )),
      ],
    ).marginSymmetric(horizontal: 12, vertical: 10);
  }
}
