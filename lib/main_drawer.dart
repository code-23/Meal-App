import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 130,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20.0),
              color: Colors.orange,
              child: Text(
                "Cooking up!",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 40.0,
                    color: Colors.black),
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              "Meals",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              "Filter",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          )
        ],
      ),
    );
  }
}
