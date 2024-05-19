import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'viewModel/coffee_notifier.dart';
import 'widgets/fullsize_image_Screen.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(coffeeNotifierProvider.notifier).loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final coffeeState = ref.watch(coffeeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Coffees')),
      body: coffeeState is FavoritesLoaded
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: coffeeState.favoriteImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullImageScreen(
                            imagePath: coffeeState.favoriteImages[index],
                          ),
                        ),
                      );
                    },
                    child: Image.file(
                      File(coffeeState.favoriteImages[index]),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )
          : const Center(child: Text('No favorites yet')),
    );
  }
}
