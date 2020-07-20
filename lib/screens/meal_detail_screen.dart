import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String route = 'MealDetailScreen';
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: SafeArea(
        child: Container(
          child: Text('Meal-$id'),
        ),
      ),
    );
  }
}
