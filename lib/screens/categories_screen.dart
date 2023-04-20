import 'package:flutter/material.dart';
import 'package:mealsapp/data/category_data.dart';
import 'package:mealsapp/screens/meals_screen.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';
import 'package:mealsapp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where(
            (meal) => meal.categories.contains(category.id)
    ).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectedCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
