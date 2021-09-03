import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';
import 'package:meals_app/models/meal.dart';

class Favoritescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Favorite Food"),
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: Center(
        child: Text('The favorite screen'),
      ),
    );
  }
}
