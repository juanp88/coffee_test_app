import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_test_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Core/utils/app_strings.dart';
import 'viewModel/coffee_notifier.dart';

class NewImageScreen extends ConsumerWidget {
  const NewImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffeeState = ref.watch(coffeeNotifierProvider);
    final coffeeNotifier = ref.read(coffeeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: AppTheme.lightGrey, // Use color from the theme
                  child: coffeeNotifier.lastImageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: coffeeNotifier.lastImageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : coffeeState is CoffeeError
                          ? Center(
                              child: Text(
                                  '${AppStrings.error}: ${coffeeState.message}'))
                          : const SizedBox.shrink(),
                ),
                if (coffeeState is CoffeeLoading)
                  const Center(
                      child: CircularProgressIndicator()), // Loading indicator
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('Btn_load_new_image'),
              onPressed: () => coffeeNotifier.fetchCoffeeImage(context),
              child: const Text(AppStrings.loadNewImage),
            ),
            const SizedBox(height: 10),
            if (coffeeState is CoffeeLoaded)
              ElevatedButton(
                key: const Key('Btn_save_to_favorites'),
                onPressed: () => coffeeNotifier.saveImage(coffeeState.imageUrl),
                child: const Text(AppStrings.saveToFavorites),
              ),
          ],
        ),
      ),
    );
  }
}
