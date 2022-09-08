import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category category =
      ModalRoute.of(context)?.settings.arguments as Category;
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
