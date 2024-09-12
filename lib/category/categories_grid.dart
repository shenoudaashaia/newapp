import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/category/category_item.dart';
import 'package:newapp/category/category_model.dart';

class CategorisGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;

  CategorisGrid({required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          color: Color(0xFFC91C22), name: "sport", imageName: "ball", id:"sports"),
      CategoryModel(
          color: Color(0xFFC91C22),
          name: "Business",
          imageName: "bussines",
          id: 'business'),
      CategoryModel(
          color: Color(0xFFC91C22), name: "sport", imageName: "ball", id: ''),
      CategoryModel(
          color: Color(0xFFC91C22), name: "sport", imageName: "ball", id: ''),
      CategoryModel(
          color: Color(0xFFC91C22), name: "sport", imageName: "ball", id: ''),
      CategoryModel(
          color: Color(0xFFC91C22), name: "sport", imageName: "ball", id: ''),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                final Category = categories[index];
                return GestureDetector(
                  onTap: () => onCategorySelected(Category),
                  child: CategoryItem(index: index, Category: Category),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
