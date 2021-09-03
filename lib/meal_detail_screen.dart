import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routname = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final selectmeal = DUMMY_MEALS.firstWhere((meals) => meals.id == args);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('${selectmeal.title}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Image.network(
                  selectmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                      fontFamily: 'writing',
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0),
                )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: selectmeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        selectmeal.ingredients[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Steps",
                style: TextStyle(
                    fontFamily: 'writing',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                height: 200,
                width: 300,
                child: ListView.builder(
                    itemCount: selectmeal.steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectmeal.steps[index]),
                      );
                    }))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
