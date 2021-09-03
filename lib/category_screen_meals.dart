import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealsscreen extends StatefulWidget {
  /*final String categoryid;
  final String categoryt;
  CategoryMealsscreen(this.categoryid, this.categoryt);*/
  final List<Meal> available;
  CategoryMealsscreen(this.available);

  @override
  _CategoryMealsscreenState createState() => _CategoryMealsscreenState();
}

class _CategoryMealsscreenState extends State<CategoryMealsscreen> {
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final cattitle = routeargs['title'];
    final catid = routeargs['id'];
    final categorymeals = widget.available
        .where((meal) => meal.categories.contains(catid))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle!),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categorymeals[index].id,
              title: categorymeals[index].title,
              imageUrl: categorymeals[index].imageUrl,
              affordability: categorymeals[index].affordability,
              complexity: categorymeals[index].complexity,
              duration: categorymeals[index].duration);
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
