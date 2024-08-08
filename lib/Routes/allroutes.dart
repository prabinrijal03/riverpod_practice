import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/Screen/features/Getting_Started/get_started.dart';
import 'package:flutter_application_1/Screen/features/heightCheck.dart';
import 'package:flutter_application_1/Screen/features/moodCheck.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppRoute {
  getStart,
  home,
  mood,
  height,
  main,
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/getStart',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/getStart',
          name: AppRoute.getStart.name,
          builder: (context, state) => GetStarted(),
        ),
        ShellRoute(
            builder: (context, state, child) {
              return MainScreen(child: child);
            },
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                builder: (context, state) => const Home(),
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Home(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    );

                    // FadeTransition(
                    //   opacity: animation,
                    //   child: child,
                    // );
                  },
                ),
              ),
              GoRoute(
                path: '/mood',
                name: AppRoute.mood.name,
                builder: (context, state) => const Mood(),
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Mood(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                path: '/height',
                name: AppRoute.height.name,
                builder: (context, state) => const Height(),
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Height(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    );
                  },
                ),
              ),
            ])
      ],
    );
  },
);
