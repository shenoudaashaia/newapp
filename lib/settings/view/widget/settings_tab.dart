import 'package:flutter/material.dart';
import 'package:newapp/categories/data/modles/category_model.dart';
import 'package:newapp/home/view/widget/home_drawer.dart';
import 'package:newapp/settings/view/widget/setting_provider.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    bool isEnglish = settingProvider.isEnglish;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.language,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 16),
            height: 50,
            width: 300,
            decoration:
                BoxDecoration(border: Border.all(color: AppTheme.primary)),
            child: DropdownButton<bool>(
                alignment: Alignment.bottomCenter,
                underline: const SizedBox(),
                isExpanded: true,
                iconEnabledColor: AppTheme.primary,
                icon: const Icon(Icons.arrow_drop_down),
                style: const TextStyle(fontSize: 19, color: AppTheme.primary),
                value: isEnglish,
                items: [
                  DropdownMenuItem(
                    value: true,
                    child: Text(appLocalizations.english),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text(appLocalizations.arabic),
                  ),
                ],
                onChanged: (_) {
                  settingProvider.changeLanguage();
                }),
          ),
        ],
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
