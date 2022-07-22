import 'package:flutter/material.dart';

import '../models/Meals.dart';
import '../Widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = 'Favourite-meal';
  final List<Meal> _favouriteMeals;
  FavouriteScreen(this._favouriteMeals);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return widget._favouriteMeals.length >0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                title: widget._favouriteMeals[index].title,
                imageUrl: widget._favouriteMeals[index].imageUrl,
                duration: widget._favouriteMeals[index].duration,
                complexity: widget._favouriteMeals[index].complexity,
                affordability: widget._favouriteMeals[index].affordability,
                id: widget._favouriteMeals[index].id.toString(),
              );
            },
            itemCount: widget._favouriteMeals.length,
          )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_constructors
        children: [Container(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("You have not added any Meals yet"),
        )),
        Image.network("https://st2.depositphotos.com/1001911/7684/v/950/depositphotos_76840867-stock-illustration-pointing-at-himself-emoticon.jpg")
        ],
          );
  }
}
