import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

import 'models/category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  void _categoryItemOnTap(BuildContext ctx){
    Navigator.of(ctx).push(
      MaterialPageRoute(
          builder: (_) => CategoryMealsScreen(category)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _categoryItemOnTap(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.bgColor.withOpacity(0.7),
              category.bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
