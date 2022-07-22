import 'package:flutter/material.dart';

import '../Screens/Category_Meals_Screen.dart';

class CategoryData extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryData({required this.color, required this.title, required this.id});

  
  void SelectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () => SelectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Center(child: Text(title, style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.7),
                    color,
    
                    // it only takes gradient values of same color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
