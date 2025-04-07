import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Card Viewer',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepOrange),
      home: const RecipeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Recipe {
  final String title;
  final String imageUrl;
  final String description;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

final List<Recipe> recipes = [
  Recipe(
    title: 'Spaghetti',
    imageUrl:
        'https://images.unsplash.com/photo-1601312371834-4b3b9c9f92c4?auto=format&fit=crop&w=800&q=80',
    description: 'Classic Italian pasta with tomato and meat sauce.',
  ),
  Recipe(
    title: 'Grilled Chicken',
    imageUrl:
        'https://images.unsplash.com/photo-1601050691186-b8eec70d8f09?auto=format&fit=crop&w=800&q=80',
    description: 'Tender grilled chicken with herbs and lemon.',
  ),
  Recipe(
    title: 'Avocado Toast',
    imageUrl:
        'https://images.unsplash.com/photo-1604909052477-e6b6de59f6aa?auto=format&fit=crop&w=800&q=80',
    description: 'Healthy avocado toast with poached egg.',
  ),
  Recipe(
    title: 'Veggie Pizza',
    imageUrl:
        'https://images.unsplash.com/photo-1613145992452-0f3e198677b5?auto=format&fit=crop&w=800&q=80',
    description: 'Delicious homemade veggie pizza.',
  ),
  Recipe(
    title: 'Sushi Rolls',
    imageUrl:
        'https://images.unsplash.com/photo-1627308595229-7830a5c91f9f?auto=format&fit=crop&w=800&q=80',
    description: 'Fresh sushi rolls with salmon and avocado.',
  ),
  Recipe(
    title: 'Pancakes',
    imageUrl:
        'https://images.unsplash.com/photo-1584270354995-d3a2986f5c7b?auto=format&fit=crop&w=800&q=80',
    description: 'Fluffy pancakes topped with maple syrup.',
  ),
  Recipe(
    title: 'Burgers',
    imageUrl:
        'https://images.unsplash.com/photo-1594007654729-407eedc4be94?auto=format&fit=crop&w=800&q=80',
    description: 'Juicy beef burgers with melted cheese.',
  ),
  Recipe(
    title: 'Caesar Salad',
    imageUrl:
        'https://images.unsplash.com/photo-1613145992482-1a4eaa2173b0?auto=format&fit=crop&w=800&q=80',
    description: 'Crispy lettuce, chicken, and creamy dressing.',
  ),
  Recipe(
    title: 'Fruit Bowl',
    imageUrl:
        'https://images.unsplash.com/photo-1600891964099-44c1b3de4561?auto=format&fit=crop&w=800&q=80',
    description: 'Colorful bowl of fresh fruits.',
  ),
];

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailScreen(recipe: recipe),
                  ),
                );
              },
              child: Hero(
                tag: recipe.title,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          recipe.imageUrl,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recipe.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
