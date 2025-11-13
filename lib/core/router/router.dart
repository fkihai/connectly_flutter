import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);
final GlobalKey<NavigatorState> _internalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'internal');

final GoRouter router = GoRouter(
  routes: <RouteBase>[ShellRoute(routes: <RouteBase>[])],
);
