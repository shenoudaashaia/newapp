import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newapp/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source});

  final String source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical:6,horizontal:12),
      margin:EdgeInsets.symmetric(vertical:8,),
      decoration: BoxDecoration(
      color:isSelected==true? AppTheme.Primary:AppTheme.white ,
        borderRadius:BorderRadius.all(Radius.circular(25)),
        border:Border.all(
          color:AppTheme.Primary,
          width:2),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected == true ? AppTheme.white : AppTheme.Primary),
      ),
    );
  }
}
