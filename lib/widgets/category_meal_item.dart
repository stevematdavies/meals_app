import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meal_detail_screen.dart';

class CategoryMealItem extends StatelessWidget {
  final Meal meal;

  const CategoryMealItem(this.meal, {Key? key}) : super(key: key);

  void onMealSelect(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryMealDetailScreen.routeName, arguments: meal);
  }

  String get complexityLabel {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Simple';
    }
  }

  String get affordabilityLabel {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Affordable';
    }
  }

  List<Widget> get bottomBarItems {
    return [
      Row(
        children: [
          const Icon(Icons.schedule),
          const SizedBox(width: 6),
          Text('${meal.duration} min'),
        ],
      ),
      Row(
        children: [
          const Icon(Icons.work),
          const SizedBox(width: 6),
          Text(complexityLabel),
        ],
      ),
      Row(
        children: [
          const Icon(Icons.euro_rounded),
          const SizedBox(width: 6),
          Text(affordabilityLabel),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMealSelect(context),
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
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: bottomBarItems),
            )
          ],
        ),
      ),
    );
  }
}
