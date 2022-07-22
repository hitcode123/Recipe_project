// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';
import '../Screens/Categories_screen.dart';
import '../Screens/Favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final FavouriteLists;
  TabsScreen(this.FavouriteLists);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 List<Map<String, dynamic>> _pages=[];

 
  @override
  void initState() {
    super.initState();
    
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.FavouriteLists),
        'title': 'Favourites',
      }
    ];

  }

  int _currentIndex = 0;

  void selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(_pages[_currentIndex]['title'].toString()),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MainDrawer(),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}




























    /*DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 5,
              
                bottom: TabBar(
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.category), text: 'Categories'),
                    Tab(
                      icon: Icon(Icons.star),
                      text: 'Favourites',
                    )
                  ],
                ))
                ,body: TabBarView(children: [CategoriesScreen(),FavouriteScreen()]),));
  }
*/