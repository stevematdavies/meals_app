import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealItem extends StatelessWidget {
  final Meal meal;

  const CategoryMealItem(this.meal, {Key? key}) : super(key: key);

  void onMealSelect() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onMealSelect,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
