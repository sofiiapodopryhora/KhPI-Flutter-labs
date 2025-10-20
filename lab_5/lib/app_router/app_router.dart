import 'package:go_router/go_router.dart';
import '../views/home_page.dart';
import '../views/details_page.dart';
import '../views/github_stats_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsPage(),
    ),
    GoRoute(
      path: '/github',
      builder: (context, state) => const GitHubStatsPage(),
    ),
  ],
);