import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../constants.dart';
import '../screens/meal_detail_screen.dart';

class MealCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealCard({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
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

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.route, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height / 3;
    final double width = (MediaQuery.of(context).size.width - 20);
    final double imageTitleWidth = width * 0.8;
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
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
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
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
