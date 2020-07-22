import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(),
        MealDetailScreen.route: (context) => MealDetailScreen(),
        FilterSettingsScreen.route: (context) => FilterSettingsScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => TabsScreen()),
    );
  }
}
