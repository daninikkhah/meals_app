import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './data_sample.dart';
import './models/meal.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  void _setFilters(
      bool isGlutenFree, bool isLactoseFree, bool isVegan, bool isVegetarian) {
    setState(() {
      _isGlutenFree = isVegetarian;
      _isLactoseFree = isLactoseFree;
      _isVegan = isVegan;
      _isVegetarian = isVegetarian;
    });
  }

  @override
  Widget build(BuildContext context) {
    availableMeals = DUMMY_MEALS.where((Meal meal) {
      if (_isGlutenFree && !meal.isGlutenFree) return false;
      if (_isLactoseFree && !meal.isLactoseFree) return false;
      if (_isVegan && !meal.isVegan) return false;
      if (_isVegetarian && !meal.isVegetarian) return false;
      return true;
    }).toList();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                  color:
                      Color.fromRGBO(20, 51, 51, 1)), // is const useful here?
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: GoogleFonts.damion().copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
      ),
      initialRoute: TabsScreen.route,
      routes: {
        TabsScreen.route: (context) => TabsScreen(),
        //CategoryScreen.route: (context) => CategoryScreen(),
        CategoryMealsScreen.route: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.route: (context) => MealDetailScreen(),
        FilterSettingsScreen.route: (context) =>
            FilterSettingsScreen(_setFilters),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => TabsScreen()),
    );
  }
}
