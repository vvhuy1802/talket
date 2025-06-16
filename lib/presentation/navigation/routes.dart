import 'package:auto_route/auto_route.dart';
import 'package:talket/presentation/navigation/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: ConversionRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
