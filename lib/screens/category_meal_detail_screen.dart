import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../models/meal.dart';

class CategoryMealDetailScreen extends StatelessWidget {
  static const routeName = '/category-meal-detail';

  const CategoryMealDetailScreen({Key? key}) : super(key: key);

  Widget _sectionTitle(String text, BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.headline6),
      );

  Widget _decoratedSectionContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _sectionTitle('Ingredients', context),
            _decoratedSectionContainer(ListView.builder(
              itemBuilder: (ctx, idx) {
                var ingredients = meal.ingredients[idx];
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      ingredients,
                    ),
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            )),
            _sectionTitle('Instructions', context),
            _decoratedSectionContainer(ListView.builder(
                itemBuilder: (_, idx) {
                  var step = meal.steps[idx];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('#${idx + 1}'),
                    ),
                    title: Text(step),
                  );
                },
                itemCount: meal.steps.length))
          ],
        ));
  }
}
