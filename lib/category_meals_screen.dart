import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  final Category category;

  const CategoryMealsScreen(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(category.title),
      ),
      body: const Center(
        child: Text('The Meal recipes for the category'),
      ),
    );
  }
}
