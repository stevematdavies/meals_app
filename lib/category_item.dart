import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Text(category.title),
    );
  }
}
