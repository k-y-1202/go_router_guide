import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_guide/pages/bottom_navigation_page.dart';
import 'package:go_router_guide/pages/home_page.dart';
import 'package:go_router_guide/pages/login_page.dart';
import 'package:go_router_guide/pages/my_page.dart';
import 'package:go_router_guide/pages/profile_edit_page.dart';
import 'package:go_router_guide/router/router_utils.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: APP_PAGE.home.toPath,
    navigatorKey: _navigatorKey,
    redirect: (context, state) {
      const bool isLogin = true;
      if (isLogin == false) {
        return APP_PAGE.login.toPath;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: APP_PAGE.login.toPath,
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
            path: APP_PAGE.home.toPath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomePage());
            },
          ),
          GoRoute(
              path: APP_PAGE.mypage.toPath,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: MyPage());
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _navigatorKey,
                  path: APP_PAGE.mypageEdit.toPath,
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
