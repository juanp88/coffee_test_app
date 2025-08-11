import 'package:coffee_test_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Core/utils/app_strings.dart';
import 'viewModel/coffee_notifier.dart';
import 'widgets/app_header.dart';
import 'widgets/coffee_action_buttons.dart';
import 'widgets/coffee_image_card.dart';

class NewImageScreen extends ConsumerWidget {
  const NewImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffeeState = ref.watch(coffeeNotifierProvider);
    final coffeeNotifier = ref.read(coffeeNotifierProvider.notifier);

    // Listen to state changes for showing snackbars
    ref.listen(coffeeNotifierProvider, (previous, next) {
      if (next is CoffeeError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(child: Text(next.message)),
              ],
            ),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    });

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header
                const AppHeader(
                  title: AppStrings.appTitle,
                  subtitle: 'Discover your perfect coffee moment',
                ),
                const SizedBox(height: 40),

                // Coffee Image Card
                CoffeeImageCard(
                  coffeeState: coffeeState,
                  lastImageUrl: coffeeNotifier.lastImageUrl,
                ),

                const SizedBox(height: 32),

                // Action Buttons
                CoffeeActionButtons(
                  coffeeState: coffeeState,
                  onLoadNewImage: () => coffeeNotifier.fetchCoffeeImage(),
                  onSaveToFavorites: coffeeState is CoffeeLoaded
                      ? () => coffeeNotifier.saveImage(coffeeState.imageUrl)
                      : null,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
