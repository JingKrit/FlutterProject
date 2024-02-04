import 'package:ex_02/app_service.dart';
import 'package:ex_02/screens/home_screen.dart';
import 'package:ex_02/screens/login_screen.dart';
import 'package:ex_02/screens/main_screen.dart';
import 'package:ex_02/screens/proddetail_screen.dart';
import 'package:ex_02/screens/prodlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  redirect: _redirect,
  refreshListenable: AppService.instance,
  navigatorKey: AppService.instance.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'main',
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'product_listing',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListingScreen();
          },
        ),
        GoRoute(
          path: 'product/:id',
          builder: (BuildContext context, GoRouterState state) {
            // get value from path or query string
            var id = state.pathParameters['id'] ?? '';
            return ProductDetailScreen(productId: id);
          },
        )
      ],
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLogged;

  if (!isLoggedIn) {
    return '/';
  } else if (isLoggedIn) {
    return '/main';
  }
  return null;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
