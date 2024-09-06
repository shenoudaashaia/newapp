import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String id;
  final String imageName;
  final Color color;
  CategoryModel(
      {required this.color,
      required this.name,
      required this.imageName,
      required this.id});
}
