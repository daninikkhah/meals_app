import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../constants.dart';

class MealCard extends StatelessWidget {
//  final String id;
//  final List<String> categories;
  final String title;
  final String imageUrl;
//  final List<String> ingredients;
//  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
//  final bool isGlutenFree;
//  final bool isLactoseFree;
//  final bool isVegan;
//  final bool isVegetarian;
  MealCard({
//        @required this.id,
//      @required this.categories,
    @required this.title,
    @required this.imageUrl,
//      @required this.ingredients,
//      @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
//      @required this.isGlutenFree,
//      @required this.isLactoseFree,
//      @required this.isVegan,
//      @required this.isVegetarian
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Medium';
      case Complexity.Hard:
        return 'hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Medium';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height / 3;
    final double width = (MediaQuery.of(context).size.width - 20);
    final double imageTitleWidth = width * 0.8;
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
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
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: width * 0.1 - 5, //TODO: center the text
                  child: Container(
                    width: imageTitleWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.black38, //TODO fit the background to text
                    child: Text(
                      title,
                      style: kMealCardTextStyle,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
