import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryMealDetailScreen extends StatelessWidget {
  static const routeName = '/category-meal-detail';

  const CategoryMealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      body: Center(
        child: Text(meal.title),
      )
    );
  }
}
