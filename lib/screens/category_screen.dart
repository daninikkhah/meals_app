import 'package:flutter/material.dart';
import '../data_sample.dart';
import '../widgets/category_card.dart';
import '../constants.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = 'CategoryScreen';
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GridView(
      padding: const EdgeInsets.all(15),
      children: categoryList
          .map((category) => CategoryCard(
              title: category.title, id: category.id, color: category.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: deviceWidth * 0.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.5),
    );
  }
}
