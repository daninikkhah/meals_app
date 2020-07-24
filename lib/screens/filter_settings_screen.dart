import 'package:flutter/material.dart';
import './tabs_screen.dart';
import './main_drawer.dart';
import '../widgets/filter_switch_list_tile.dart';

class FilterSettingsScreen extends StatefulWidget {
  static const String route = 'filter settings screen';
  final Function setFilters;
  FilterSettingsScreen(this.setFilters);

  @override
  _FilterSettingsScreenState createState() => _FilterSettingsScreenState();
}

class _FilterSettingsScreenState extends State<FilterSettingsScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Settings',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.setFilters(
              _isGlutenFree, _isLactoseFree, _isVegan, _isVegetarian);
          Navigator.of(context).pushNamed(TabsScreen.route);
        },
        child: Icon(Icons.search),
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
            switchValue: _isVegan,
            onChanged: (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'vegetarian',
            subtitle: 'only included vegetarian meals.',
            switchValue: _isVegetarian,
            onChanged: (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'gluten-Free',
            subtitle: 'only included gluten-Free meals.',
            switchValue: _isGlutenFree,
            onChanged: (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            },
          ),
          FilterSwitchListTile(
            title: 'lactose-Free',
            subtitle: 'only included lactose-Free meals.',
            switchValue: _isLactoseFree,
            onChanged: (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            },
          )
        ],
      ),
    );
  }
}
