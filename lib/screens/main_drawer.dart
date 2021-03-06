import 'package:flutter/material.dart';
import './tabs_screen.dart';
import './filter_settings_screen.dart';

class MainDrawer extends StatelessWidget {
  void func() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              color: Colors.brown,
              child: Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu,
                size: 26,
              ),
              title: Text(
                'Meals',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(TabsScreen.route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                size: 26,
              ),
              title: Text(
                'Filters',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FilterSettingsScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
