import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data_sample.dart';
import '../models/meal.dart';
import '../widgets/recipe_tile.dart';
import '../widgets/ingredient_grid_view.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen({@required this.isFavorite, @required this.toggleFavorite});
  static const String route = 'MealDetailScreen';
  final Function isFavorite;
  final Function toggleFavorite;
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final Meal meal =
        DUMMY_MEALS.firstWhere((currentMeal) => currentMeal.id == id);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              icon: Icon(isFavorite(id) ? Icons.star : Icons.star_border),
              onPressed: () => toggleFavorite(id))
        ],
      ),
      body: SafeArea(
        child: Container(
          //TODO: make image shrink when scrolling down
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: height / 3,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                height: height / 2,
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return i == 0
                        ? Column(
                            children: [
                              const Text(
                                'Ingredients',
                                style: TextStyle(fontSize: 24),
                              ),
                              IngredientsGridView(
                                  height: height, width: width, meal: meal),
                              const Text(
                                'Recipe',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          )
                        : RecipeTile(index: i - 1, step: meal.steps[i - 1]);
                  },
                  itemCount: meal.steps.length + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
