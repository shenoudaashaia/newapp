import 'package:flutter/material.dart';
import 'package:newapp/app_theme.dart';
import 'package:newapp/category/category_model.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CategoryModel Category;

  CategoryItem({required this.index, required this.Category});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(index.isEven ? 24 : 0),
          bottomRight: Radius.circular(index.isOdd ? 24 : 0),
        ),
        color: Category.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${Category.imageName}.png",
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Text(
            Category.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.white),
          ),
        ],
      ),
    );
  }
}
