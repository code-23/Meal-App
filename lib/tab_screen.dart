import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/favorite_screent.dart';

import 'package:meals_app/models/meal.dart';

class Tabscreen extends StatefulWidget {
  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  final List<Widget> pages = [
    Categories(),
    Favoritescreen(),
  ];

  int selectpageindex = 0;
  @override
  void selectpage(int index) {
    setState(() {
      selectpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectpageindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        currentIndex: selectpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
