import 'package:flutter/material.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;

  const HomeDrawer({super.key, required this.onItemSelected});
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    final screenSize = MediaQuery.of(context).size;
    
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenSize.height * 0.2,
            width: double.infinity,
            color: AppTheme.primary,
            child: Text(
              appLocalizations.newsapp,
              style: titleLargeStyle?.copyWith(color: AppTheme.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 6, start: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.catrgory),
                    child: Row(
                      children: [
                        Icon(Icons.menu_sharp),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                         appLocalizations.categorys,
                          style: titleLargeStyle,
                        ),
                      ],
                    ),
                  ),
                 const  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          appLocalizations.settings,
                          style: titleLargeStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  catrgory,
  settings;
}
