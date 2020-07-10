import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  CategoryCard({@required this.title, @required this.id, @required this.color});

  void navigate(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryMealsScreen(
              id: id,
              title: title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
