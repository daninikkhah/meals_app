import 'package:flutter/material.dart';
import '../models/meal.dart';

class IngredientsGridView extends StatelessWidget {
  const IngredientsGridView({
    Key key,
    @required this.height,
    @required this.width,
    @required this.meal,
  });

  final double height;
  final double width;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Icon(Icons.fastfood), //TODO: icon for each ingredient
              ],
            ),
          ),
        ),
        itemCount: meal.ingredients.length,
      ),
    );
  }
}
