import 'package:constellation/model/constellation.dart';
import 'package:constellation/page/pages.dart';
import 'package:go_router/go_router.dart';

final constellationData = <Constellation>[];

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/:constellation',
      builder: (context, state) {
        final constellation = constellationData.where((element) =>
            element.constellationName ==
            state.pathParameters['constellation']!).first;

        return ConstellationPage(
          constellation: constellation,
        );
      },
    ),
  ],
);
