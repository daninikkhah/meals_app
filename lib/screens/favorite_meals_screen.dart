import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_card.dart';

class FavoriteMealsScreen extends StatelessWidget {
  FavoriteMealsScreen({
    @required this.meals,
  });
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Center(
            child: Text(
            'No favorite meal!',
            style: TextStyle(fontSize: 24),
          ))
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealCard(
                id: meals[index].id,
                imageUrl: meals[index].imageUrl,
                title: meals[index].title,
                duration: meals[index].duration,
                complexity: meals[index].complexity,
                affordability: meals[index].affordability,
              ); //TODO: meal card
            },
            itemCount: meals.length,
          );
  }
}
