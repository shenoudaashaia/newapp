import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newapp/app_theme.dart';
import 'package:newapp/category/categories_grid.dart';
import 'package:newapp/category/category_details.dart';
import 'package:newapp/category/category_model.dart';
import 'package:newapp/drawer/home_drawer.dart';
import 'package:newapp/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null
            ? CategoriesDetails(categoryId: selectedCategory!.id)
            : onSelectedDrawerItem == DrawerItem.catrgory
                ? CategorisGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  DrawerItem onSelectedDrawerItem = DrawerItem.catrgory;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    onSelectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
