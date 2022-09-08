import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryMealDetailScreen extends StatelessWidget {
  static const routeName = '/category-meal-detail';

  const CategoryMealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Center(
          child: Text(meal.id),
        ));
  }
}
