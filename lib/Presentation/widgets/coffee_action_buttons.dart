import 'package:coffee_test_app/app_theme.dart';
import 'package:flutter/material.dart';
import '../viewModel/coffee_notifier.dart';
import '../../Core/utils/app_strings.dart';

class CoffeeActionButtons extends StatelessWidget {
  final CoffeeState coffeeState;
  final VoidCallback onLoadNewImage;
  final VoidCallback? onSaveToFavorites;

  const CoffeeActionButtons({
    super.key,
    required this.coffeeState,
    required this.onLoadNewImage,
    this.onSaveToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            key: const Key('Btn_load_new_image'),
            onPressed: coffeeState is CoffeeLoading ? null : onLoadNewImage,
            icon: const Icon(Icons.refresh_rounded),
            label: Text(
              coffeeState is CoffeeLoading
                  ? 'Loading...'
                  : AppStrings.loadNewImage,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBrown,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppTheme.lightBrown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
        ),
        if (coffeeState is CoffeeLoaded && onSaveToFavorites != null) ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              key: const Key('Btn_save_to_favorites'),
              onPressed: onSaveToFavorites,
              icon: const Icon(Icons.favorite_rounded),
              label: const Text(AppStrings.saveToFavorites),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
