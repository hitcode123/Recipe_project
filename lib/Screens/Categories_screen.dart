import 'package:flutter/material.dart';


import '../Widgets/category_data.dart';
import '../Screens/Category_Meals_Screen.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen();

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return 
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
       Padding(
         padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 15),
         child: GridView(
          children: DUMMY_CATEGORIES
              .map((e) => Container(child: CategoryData(title: e.title, color: e.color, id: e.id)))
              .toList(),
              //  padding: const EdgeInsets.all(25),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/ 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            
          ),
          
      
    ),
       );
  }
}
