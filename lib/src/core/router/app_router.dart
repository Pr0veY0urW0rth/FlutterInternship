import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/presentation/screens/auth_screen.dart';
import 'package:intership/src/features/qr_code_scan/presentation/screens/qr_code_scan_screen.dart';
import 'package:intership/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:intership/src/features/text_details/presentation/screens/text_details_screen.dart';
import 'package:intership/src/features/text_edit/presentation/screens/text_edit_screen.dart';
import 'package:intership/src/features/texts_list/presentation/screens/texts_list_Screen.dart';
import 'package:intership/src/shared/presentation/widgets/tab_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> tabBarNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> authNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> textsListNavigatorkey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> textDetailsNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> textEditNavigatorKeu =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> qrCodeScanNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;
  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String authPath = '/auth';
  static const String textsListPath = '/textsList';
  static const String textDetailsPath = '/textDetails';
  static const String textEditPath = '/textEdit';
  static const String settingsPath = '/settings';
  static const String qrCodeScanPath = '/qrCodeScan';

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: textsListNavigatorkey,
            routes: [
              GoRoute(
                path: textsListPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: TextsListScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsNavigatorKey,
            routes: [
              GoRoute(
                path: settingsPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const SettingsScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: AppTabBar(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: authPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const AuthScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '$textDetailsPath/:header/:text',
        name: textDetailsPath,
        pageBuilder: (context, state) {
          return getPage(
            child: TextDetailsScreen(
              header: state.pathParameters['header']!,
              text: state.pathParameters['text']!,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '$textEditPath/:id',
        name: textEditPath,
        pageBuilder: (context, state) {
          return getPage(
              child: TextEditScreen(
                id: int.parse(state.pathParameters['id']!),
              ),
              state: state);
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: qrCodeScanPath,
        name: qrCodeScanPath,
        pageBuilder: (context, state) {
          return getPage(child: const QRCodeScanScreen(), state: state);
        },
      )
    ];

    final supabase = sl.get<Supabase>().client.auth;

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation:
          supabase.currentSession == null ? authPath : textsListPath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
