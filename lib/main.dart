import 'package:flutter/material.dart';
import 'package:flutter_project_1_meal_screen/Screens/Favourite_screen.dart';
import 'package:flutter_project_1_meal_screen/dummy_data.dart';

import '../Screens/AppBar_Screen.dart';
import '../Screens/Categories_screen.dart';
import '../Screens/Filter_screen.dart';
import '../Screens/meal_details_screen.dart';
import '../Screens/Category_Meals_Screen.dart';
import './models/Meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaiablemeals = DUMMY_MEALS;

  Map<String, bool?> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  void _setFilters(Map<String, bool?> filterData) {
    setState(() {
      _filters = filterData;
      _avaiablemeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          print(_filters['gluten']);
          return false;
        }
        if (_filters['lactose'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isGlutenFree == false) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  final List<Meal> Favoritelists = [];
  void isToggle(String mealId) {
    int index = Favoritelists.indexWhere((MealID) {
      return MealID.id == mealId;
    });
    if (index >= 0) {
      setState(() {
        Favoritelists.removeAt(index);
      });
    } else {
      setState(() {
        Favoritelists.add(
            DUMMY_MEALS.firstWhere((MealId) => MealId.id == mealId));
      });
    }
  }

  bool isFavourite(String mealID) {
    return Favoritelists.any((MealID) => MealID.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    print(_avaiablemeals);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.blue, //background coloring
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
          ), // Your accent color
          //accent color is the color used to color the forgeound front like text
          canvasColor: const Color.fromRGBO(255, 254, 229,
              1), //canvas color is the color useed to color screen (sccaffold)
          fontFamily: 'Raleway', //default fontstyle
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              // ignore: prefer_const_constructors
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(Favoritelists),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_avaiablemeals),
          MealDetailsScreen.routeName: (ctx) =>
              MealDetailsScreen(isFavourite, isToggle),
          FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
          FavouriteScreen.routeName: (ctx) => FavouriteScreen(Favoritelists),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
