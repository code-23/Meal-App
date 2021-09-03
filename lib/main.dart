import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_screen_meals.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/filters.dart';
import 'package:meals_app/meal_detail_screen.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutin': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availablemeals = DUMMY_MEALS;
  void setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availablemeals = DUMMY_MEALS.where((meals) {
        if (_filters['glutin'] == true && !meals.isGlutenFree) {
          return false;
        } else if (_filters['lactose'] == true && !meals.isLactoseFree) {
          return false;
        } else if (_filters['vegan'] == true && !meals.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabscreen(),
        '/category-meals': (ctx) => CategoryMealsscreen(availablemeals),
        MealDetailScreen.routname: (ctx) => MealDetailScreen(),
        Filterscreen.routename: (ctx) => Filterscreen(setfilters),
      },
    );
  }
}
