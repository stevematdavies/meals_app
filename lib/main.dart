

import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meal_detail_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() => runApp(const MealApp());

class MealApp extends StatelessWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TabScreen(),
        CategoriesScreen.routeName: (_) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (_) => const CategoryMealsScreen(),
        CategoryMealDetailScreen.routeName: (_) => const CategoryMealDetailScreen(),
      },
      onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => const CategoriesScreen())
    );
  }
}

