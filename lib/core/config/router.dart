import 'package:go_router/go_router.dart';

import '../../features/plans/models/plan.dart';
import '../../features/splash/splash_page.dart';
import '../../features/splash/onboarding_page.dart';
import '../../features/home/home_page.dart';
import '../../features/plans/pages/add_plan_page.dart';
import '../../features/plans/pages/plan_detail_page.dart';
import '../../features/splash/test_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/plan-add',
      builder: (context, state) => const AddPlanPage(),
    ),
    GoRoute(
      path: '/plan-detail',
      builder: (context, state) => PlanDetailPage(
        plan: state.extra as Plan,
      ),
    ),
  ],
);
