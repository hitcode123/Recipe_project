

import 'package:flutter/material.dart';


import '../Screens/Filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        // ignore: prefer_const_constructors
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        title == 'Meals'
            ? Navigator.of(context).pushReplacementNamed('/')
            : Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
        height: 120,
        width: double.infinity,
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          'Cooking Up!',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor),
        ),
      ),
      // ignore: prefer_const_constructors
      SizedBox(height: 20),
      buildListtile('Meals', Icons.restaurant, context),
      buildListtile('filters', Icons.settings, context),
    ]));
  }
}
