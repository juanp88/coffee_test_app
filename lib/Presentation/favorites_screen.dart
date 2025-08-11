import 'package:coffee_test_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'viewModel/favorites_notifier.dart';
import 'widgets/favorite_card.dart';
import 'widgets/favorites_empty_state.dart';
import 'widgets/favorites_header.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // Schedule the loadFavorites call to run after the first frame.
    Future.microtask(
        () => ref.read(favoritesNotifierProvider.notifier).loadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoritesState = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.cream,
              AppTheme.lightGrey,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              FavoritesHeader(favoritesState: favoritesState),

              // Content
              Expanded(
                child: _buildContent(favoritesState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(FavoritesState favoritesState) {
    if (favoritesState is FavoritesLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading your favorites...',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.primaryBrown,
              ),
            ),
          ],
        ),
      );
    }

    if (favoritesState is FavoritesLoaded) {
      if (favoritesState.favoriteImages.isEmpty) {
        return const FavoritesEmptyState();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: favoritesState.favoriteImages.length,
          itemBuilder: (context, index) {
            return FavoriteCard(
              imagePath: favoritesState.favoriteImages[index],
              index: index,
            );
          },
        ),
      );
    }

    return const FavoritesEmptyState();
  }
}
