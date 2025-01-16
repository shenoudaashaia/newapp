import 'package:flutter/material.dart';
import 'package:newapp/shared/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source});
  final String source;
  final bool isSelected;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected == true ? AppTheme.primary : AppTheme.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: AppTheme.primary, width: 2),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected == true ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
