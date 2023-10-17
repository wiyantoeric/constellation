import 'package:constellation/constellation_page.dart';
import 'package:constellation/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/:constellation',
      builder: (context, state) {
        return ConstellationPage(
          // constellation: state.params['constellation']!,
        );
      },
    ),
  ],
);
