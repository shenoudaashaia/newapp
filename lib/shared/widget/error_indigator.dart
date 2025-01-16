import 'package:flutter/material.dart';

class ErrorIndigator extends StatelessWidget {
  final String massage;
   ErrorIndigator(this.massage);
  @override
  Widget build(BuildContext context) {
    return Text(massage);
  }
}
