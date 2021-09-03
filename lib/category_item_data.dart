import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/category_screen_meals.dart';

class Itemdata extends StatelessWidget {
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meals', arguments: {'id': id, 'title': title});
  }

  late final String id;
  late final String title;
  late final Color color;
  Itemdata(this.title, this.color, this.id);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SelectCategory(context),
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: 'writing'),
        )),
        color: color,
      ),
    );
  }
}
