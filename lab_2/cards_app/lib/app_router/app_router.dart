import 'package:go_router/go_router.dart';
import '../views/home_page.dart';
import '../views/details_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => DetailsPage(),
    ),
  ],
);