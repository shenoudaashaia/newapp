import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;

  HomeDrawer({required this.onItemSelected});
  @override
  Widget build(BuildContext context) {
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
            color: AppTheme.Primary,
            child: Text(
              "News APP!",
              style: titleLargeStyle?.copyWith(color: AppTheme.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 6, start: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.catrgory),
                    child: Row(
                      children: [
                        Icon(Icons.menu_sharp),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "catrgory",
                          style: titleLargeStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "settings",
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
