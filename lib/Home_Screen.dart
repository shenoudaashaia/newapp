import 'package:flutter/material.dart';
import 'package:newapp/app_theme.dart';
import 'package:newapp/category/categories_grid.dart';
import 'package:newapp/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        drawer:HomeDrawer() ,
        body: CategorisGrid(),
      ),
    );
  }
}
