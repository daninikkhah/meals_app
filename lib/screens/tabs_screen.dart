import 'package:flutter/material.dart';
import 'package:mealsapp/screens/main_drawer.dart';
import '../screens/category_screen.dart';
import '../screens/favorite_meals_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String route = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> screens = [CategoryScreen(), FavoriteMealsScreen()];
  final List<String> title = ['Meal App', 'Favorites'];
  int index = 0;
  void changeIndex(int input) {
    setState(() {
      index = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title[index],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black26,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            title: Text('Categories'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
