import 'package:coffee_test_app/app_theme.dart';
import 'package:flutter/material.dart';
import '../viewModel/favorites_notifier.dart';

class FavoritesHeader extends StatelessWidget {
  final FavoritesState favoritesState;

  const FavoritesHeader({
    super.key,
    required this.favoritesState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.accentOrange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.favorite,
              color: AppTheme.accentOrange,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorite Coffees',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.darkBrown,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  favoritesState is FavoritesLoaded
                      ? '${(favoritesState as FavoritesLoaded).favoriteImages.length} saved'
                      : 'Your collection',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.primaryBrown,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
