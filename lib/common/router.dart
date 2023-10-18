import 'package:constellation/common/constellation_data.dart';
import 'package:constellation/page/pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/:constellation',
      builder: (context, state) {
        final constellation = constellationData
            .where((element) =>
                element.constellationName ==
                state.pathParameters['constellation']!)
            .first;
        return ConstellationPage(
          constellation: constellation,
        );
      },
    ),
  ],
);
