import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Map<String,Object>> _pages = [
    {
      'pageTitle': 'Meal Categories',
      'screen': const CategoriesScreen(),

    },
    {
      'pageTitle': 'Favorite Meals',
      'screen': const FavoritesScreen(),

    }
  ];

  int _currentTabIndex = 0;

  void _onTabTap(int tabIndex){
      setState(() {
        _currentTabIndex = tabIndex;
      });
  }

  @override
  Widget build(BuildContext context) {
    final currentTabData = _pages[_currentTabIndex];
    return Scaffold(
      appBar: AppBar(
          title: Text(currentTabData['pageTitle'] as String),
      ),
      body: currentTabData['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTap,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _currentTabIndex,
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites'
          ),
        ],
      )
    );
  }
}
