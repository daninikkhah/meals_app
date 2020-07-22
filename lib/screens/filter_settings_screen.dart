import 'package:flutter/material.dart';
import './main_drawer.dart';
import '../widgets/filter_switch_list_tile.dart';

class FilterSettingsScreen extends StatefulWidget {
  static const String route = 'filter settings screen';

  @override
  _FilterSettingsScreenState createState() => _FilterSettingsScreenState();
}

class _FilterSettingsScreenState extends State<FilterSettingsScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Settings',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: const Text(
              'Adjust meal filters',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          FilterSwitchListTile(
            title: 'vegan',
            subtitle: 'only included vegan meals.',
            switchValue: isVegan,
            onChanged: (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'vegetarian',
            subtitle: 'only included vegetarian meals.',
            switchValue: isVegetarian,
            onChanged: (newValue) {
              setState(() {
                print(isVegetarian);
                isVegetarian = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'gluten-Free',
            subtitle: 'only included gluten-Free meals.',
            switchValue: isGlutenFree,
            onChanged: (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'lactose-Free',
            subtitle: 'only included lactose-Free meals.',
            switchValue: isLactoseFree,
            onChanged: (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          )
        ],
      ),
    );
  }
}
