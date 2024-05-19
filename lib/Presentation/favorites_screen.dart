import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'viewModel/favorites_notifier.dart';
import 'widgets/full_size_image_screen.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule the loadFavorites call to run after the first frame.
    Future.microtask(
        () => ref.read(favoritesNotifierProvider.notifier).loadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    final favoritesState = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Coffees')),
      body: favoritesState is FavoritesLoaded
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: favoritesState.favoriteImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullImageScreen(
                            imagePath: favoritesState.favoriteImages[index],
                          ),
                        ),
                      );
                    },
                    child: Image.file(
                      File(favoritesState.favoriteImages[index]),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )
          : favoritesState is FavoritesLoading
              ? const Center(child: CircularProgressIndicator())
              : const Center(child: Text('No favorites yet')),
    );
  }
}
