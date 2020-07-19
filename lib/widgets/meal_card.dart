import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../constants.dart';

class MealCard extends StatelessWidget {
//  final String id;
//  final List<String> categories;
//  final String title;
  final String imageUrl;
//  final List<String> ingredients;
//  final List<String> steps;
//  final int duration;
//  final Complexity complexity;
//  final Affordability affordability;
//  final bool isGlutenFree;
//  final bool isLactoseFree;
//  final bool isVegan;
//  final bool isVegetarian;
  MealCard({
//        @required this.id,
//      @required this.categories,
//      @required this.title,
    @required this.imageUrl,
//      @required this.ingredients,
//      @required this.steps,
//      @required this.duration,
//      @required this.complexity,
//      @required this.affordability,
//      @required this.isGlutenFree,
//      @required this.isLactoseFree,
//      @required this.isVegan,
//      @required this.isVegetarian
  });
  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
