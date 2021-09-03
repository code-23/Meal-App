import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });
  String get complexitytext {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'unknown';
    }
  }

  String get Affordabilitytext {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'unknown';
    }
  }

  void Selectitem(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routname, arguments: id)
        .then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Selectitem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(complexitytext),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(Affordabilitytext),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
