import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data_sample.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String route = 'MealDetailScreen';
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final Meal meal =
        DUMMY_MEALS.firstWhere((currentMeal) => currentMeal.id == id);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double aspectRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              height: height / 5,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: height / 10,
                    childAspectRatio: (height / width) * 0.2),
                itemBuilder: (context, i) => Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            meal.ingredients[i],
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.fastfood),
                      ],
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
