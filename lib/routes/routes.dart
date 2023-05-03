import 'package:expenses_app/pages/add_extras.dart';
import 'package:expenses_app/pages/add_page.dart';
import 'package:expenses_app/pages/home_page.dart';
import 'package:expenses_app/pages/settings_page.dart';
import 'package:expenses_app/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter getRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: AppRouterConstants.home,
          path: "/",
          pageBuilder: (context, state) {
            return MaterialPage(
              child: HomePage(
                isCircularGraph: false,
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.pie,
          path: "/pie_graph",
          pageBuilder: (context, state) {
            return MaterialPage(
              child: HomePage(
                isCircularGraph: true,
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.add,
          path: "/add",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: AddPage(),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.wallet,
          path: "/wallet",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: WalletPage(),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.addExtras,
          path: "/add-extras",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: AddExtrasPage(),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.settings,
          path: "/settings",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SettingsPage(),
            );
          },
        ),
      ],
    );
    return router;
  }
}

class AppRouterConstants {
  static const String home = "home";
  static const String pie = "pie_graph";
  static const String add = "add";
  static const String wallet = "wallet";
  static const String addExtras = "add-extras";
  static const String settings = "settings";
}
