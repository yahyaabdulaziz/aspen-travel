import 'package:aspen_travel/presentation/routes/routes_constants_paths.dart';
import 'package:aspen_travel/presentation/ui/main_screen/main_screen.dart';
import 'package:aspen_travel/presentation/ui/product_details/product_details.dart';
import 'package:aspen_travel/presentation/ui/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutesConstantsPaths.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutesConstantsPaths.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RoutesConstantsPaths.productDetails,
        builder: (context, state) => const ProductDetails(),
      ),
    ],
  );
}
