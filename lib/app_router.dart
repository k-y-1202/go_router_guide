import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_guide/pages/bottom_navigation_page.dart';
import 'package:go_router_guide/pages/home_page.dart';
import 'package:go_router_guide/pages/login_page.dart';
import 'package:go_router_guide/pages/my_page.dart';
import 'package:go_router_guide/pages/profile_edit_page.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _navigatorKey,
    redirect: (context, state) {
      final currentUser = 1;
      if (currentUser == 0) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BottomNavigationPage(
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomePage());
            },
          ),
          GoRoute(
              path: '/mypage',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: MyPage());
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _navigatorKey,
                  path: 'edit/:userId',
                  builder: (context, state) {
                    final userId = state.extra as String;

                    return ProfileEditPage(
                      userId: userId,
                    );
                  },
                ),
              ]),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('エラー')),
      );
    },
  );
}
