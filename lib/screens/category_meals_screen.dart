import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_card.dart';
import '../models/meal.dart';
import '../data_sample.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = 'CategoryMealsScreen';
  //final String id = 'c5';
  //final String title = 'Light & Lovely';
  //CategoryMealsScreen({@required this.title,@required this.id});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final String title = routeArgs['title'];
    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealCard(
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          ); //TODO: meal card
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
