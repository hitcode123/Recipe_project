import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/Filter-Screen';
  final Function saveFilters;
  final Map<String, bool?> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenfree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;
  void initState() {
    super.initState();
    _glutenfree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }

  Widget BuildSwitchListtile(
      String title, String description, bool currentValue, var updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Filters "), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              })
        ]),
        // ignore: prefer_const_constructors
        drawer: MainDrawer(),
        body: ListView(children: <Widget>[
          BuildSwitchListtile(
              'Gluten-free', 'Only include gluten-free meals', _glutenfree!,
              (newvalue) {
            setState(() {
              _glutenfree = newvalue;
            });
          }),
          BuildSwitchListtile(
              'Lactose-free', 'Only include Lactose-free meals', _lactoseFree!,
              (newvalue) {
            setState(() {
              _lactoseFree = newvalue;
            });
          }),
          BuildSwitchListtile(
              'Gluten-free', 'Only include vegan meals', _vegan!, (newvalue) {
            setState(() {
              _vegan = newvalue;
            });
          }),
          BuildSwitchListtile(
              'Gluten-free', 'Only include vegetarian meals', _vegetarian!,
              (newvalue) {
            setState(() {
              _vegetarian = newvalue;
            });
          })
        ]));
  }
}
