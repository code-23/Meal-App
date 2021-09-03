import 'package:flutter/material.dart';
import 'package:meals_app/category_item_data.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/main_drawer.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DeliFood",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: GridView(
        children: DUMMY_CATEGOREIS
            .map(
                (catdata) => Itemdata(catdata.title, catdata.color, catdata.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
