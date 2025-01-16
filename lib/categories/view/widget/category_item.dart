import 'package:flutter/material.dart';
import 'package:newapp/shared/app_theme.dart';

import '../../data/modles/category_model.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CategoryModel category;

  const CategoryItem({super.key, required this.index, required this.category});
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
        color: category.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${category.imageName}.png",
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Text(
            category.name,
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
