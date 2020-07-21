import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String route = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> screens = [CategoryScreen()];
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
          'Meal App',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: CategoryScreen(),
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
