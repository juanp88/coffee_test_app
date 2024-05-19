import 'package:go_router/go_router.dart';

import '../Presentation/favorites_screen.dart';
import '../Presentation/main_screeen.dart';
import '../Presentation/new_image_screen.dart';
import '../Presentation/widgets/fullsize_image_Screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const NewImageScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/full_image',
      builder: (context, state) => FullImageScreen(
        imagePath: state.extra as String,
      ),
    ),
  ],
);
