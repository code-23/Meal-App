import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';

class Filterscreen extends StatefulWidget {
  static const routename = '/filters';
  final Function SaveFilters;
  Filterscreen(this.SaveFilters);

  @override
  _FilterscreenState createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  var _GlutenFree = false;
  var _LactoseFree = false;
  var _Vegan = false;
  var _Vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedfiltersdata = {
                    'glutin': _GlutenFree,
                    'lactose': _LactoseFree,
                    'vegan': _Vegan,
                    'vegetarian': _Vegetarian
                  };
                  widget.SaveFilters(selectedfiltersdata);
                })
          ],
        ),
        drawer: Maindrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Adjust Your Meal Selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text("Glutin-Free"),
                    value: _GlutenFree,
                    subtitle: Text("Only include Glutin-Free"),
                    onChanged: (newvalue) {
                      setState(() {
                        _GlutenFree = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Lactose-Free"),
                    value: _LactoseFree,
                    subtitle: Text("Only Include Lactose-Free"),
                    onChanged: (newvalue) {
                      setState(() {
                        _LactoseFree = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegan"),
                    value: _Vegan,
                    subtitle: Text("Only Include Vegan"),
                    onChanged: (newvalue) {
                      setState(() {
                        _Vegan = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegetarian"),
                    value: _Vegetarian,
                    subtitle: Text("Only Include Vegetarian"),
                    onChanged: (newvalue) {
                      setState(() {
                        _Vegetarian = newvalue;
                      });
                    })
              ],
            ))
          ],
        ));
  }
}
