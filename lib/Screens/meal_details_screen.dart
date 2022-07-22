import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  final isFavourite;
  final Function ToggleScreen;
  MealDetailsScreen(this.isFavourite,this.ToggleScreen);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectmeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectmeal.imageUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: ((context, index) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectmeal.ingredients![index])))),
                itemCount: selectmeal.ingredients?.length,
              )),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, i) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          child: Text("#${(i + 1)}"),
                          backgroundColor: Colors.redAccent),
                      title: Text(selectmeal.steps![i]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectmeal.steps?.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child:
              widget.isFavourite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: () {
              widget.ToggleScreen(mealId);
          },
        ));
  }
}
