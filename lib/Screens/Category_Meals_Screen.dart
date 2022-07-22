import 'package:flutter/material.dart';

import '../models/Meals.dart';
import '../dummy_data.dart';
import '../Widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/Category-Meals ";
  final List<Meal> _filteredMeals;
  CategoryMealsScreen(this._filteredMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var initData = false;
  var tittle;
  List<Meal> Category_meals = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!initData) {
      final Arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final id = Arguments['id'];
      tittle = Arguments['title'];

      Category_meals = widget._filteredMeals.where((Meals) {
        return Meals.categories!.contains(id);
      }).toList();
      initData = true;
    }
    super.didChangeDependencies();
  }

  // void removeItem(String id) {
  //   setState(() {
  //     Category_meals.removeWhere((Meal) => Meal.id == id);
  //     print(Category_meals);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(tittle.toString())),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              title: Category_meals[index].title,
              imageUrl: Category_meals[index].imageUrl,
              duration: Category_meals[index].duration,
              complexity: Category_meals[index].complexity,
              affordability: Category_meals[index].affordability,
              id: Category_meals[index].id.toString(),
            );
          }),
          itemCount: Category_meals.length,
        ));
  }
}
