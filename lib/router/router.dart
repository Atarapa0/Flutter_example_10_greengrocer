import 'package:go_router/go_router.dart';
import 'package:example/core/widgets/bottom_nav.dart';
import 'package:example/pages/greengrocer.dart';
import 'package:example/pages/add_items.dart';
import 'package:example/pages/basket.dart';

final router = GoRouter(
  initialLocation: '/greengrocer',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        GoRoute(
          path: '/greengrocer',
          pageBuilder: (context, state) => const NoTransitionPage( child: Greengrocer()),
        ),
        GoRoute(
          path: '/add-items',
          pageBuilder: (context, state) => const NoTransitionPage( child: AddItems()),        ),
        GoRoute(
          path: '/basket',
          pageBuilder: (context, state) => const NoTransitionPage( child: Basket()),        ),
      ],
    )
  ],
);