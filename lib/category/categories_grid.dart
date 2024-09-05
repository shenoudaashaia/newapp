import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/category/category_item.dart';
import 'package:newapp/category/category_model.dart';

class CategorisGrid extends StatelessWidget {
  List<CategoryModel> categories = [
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    CategoryModel(color:Color(0xFFC91C22), name:"sport", imageName:"ball"),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "fgsdasdfgsad dfasd fdasd",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
              itemBuilder: (_, index) => CategoryItem(
                index: index,
                Category:categories[index],
              ),
              itemCount:categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
