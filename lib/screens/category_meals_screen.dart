import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/category_meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  Widget _mealForCategory(BuildContext ctx, int index, Meal meal){
    return CategoryMealItem(meal);
  }

  @override
  Widget build(BuildContext context) {
    final Category category =
      ModalRoute.of(context)?.settings.arguments as Category;
    final mealsForCategory = dummyMeals.where((meal) =>
          meal.categories.contains(category.id)).toList();
    return Scaffold(
      appBar: AppBar(
        title:  Text(category.title),
      ),
      body: ListView.builder(
          itemBuilder: (c,i) => _mealForCategory(c,i, mealsForCategory[i]),
        itemCount: mealsForCategory.length,
      )
    );
  }
}
