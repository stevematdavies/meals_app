import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'models/category.dart';
import 'models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  Widget _mealForCategory(BuildContext ctx, int index, List<Meal> meals){
    return Text(meals[index].title);
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
          itemBuilder: (c,i) => _mealForCategory(c,i, mealsForCategory),
        itemCount: mealsForCategory.length,
      )
    );
  }
}
