import 'package:flutter/material.dart';
import '../models/meal.dart';

//TODO: make items tapabble and show bigger card on tap
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
      height: height / 4,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: height / 8,
            childAspectRatio: (height / width) * 0.25),
        itemBuilder: (context, i) => Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      meal.ingredients[i],
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                    ),
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
