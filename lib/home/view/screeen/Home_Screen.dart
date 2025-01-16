import 'package:flutter/material.dart';
import 'package:newapp/home/view/widget/searche_screen.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:newapp/categories/view/widget/categories_grid.dart';
import 'package:newapp/categories/view/widget/category_details.dart';
import 'package:newapp/categories/data/modles/category_model.dart';
import 'package:newapp/home/view/widget/home_drawer.dart';
import 'package:newapp/settings/view/widget/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            onSelectedDrawerItem == DrawerItem.settings
                ? appLocalizations.settings
                : appLocalizations.newsapp,
          ),
          actions: onSelectedDrawerItem == DrawerItem.settings
              ? [] 
              : [
                  IconButton(
                    onPressed: () => showSearch(
                      context: context,
                      delegate: NewsSearchDelegate(),
                    ),
                    icon: const Icon(Icons.search, size: 32),
                  ),
                ],
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
