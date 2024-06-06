import 'package:go_router/go_router.dart';

import '../../features/plans/models/plan.dart';
import '../../features/plans/pages/add/plan_departure_page.dart';
import '../../features/plans/pages/add/plan_hotel_page.dart';
import '../../features/plans/pages/add/plan_name_page.dart';
import '../../features/plans/pages/add/plan_arrival_page.dart';
import '../../features/plans/pages/add/plan_note_page.dart';
import '../../features/plans/pages/add/plan_ticket_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/splash/onboarding_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/plans/pages/plan_detail_page.dart';
import '../../features/splash/test_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/home',
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
      path: '/plan-detail',
      builder: (context, state) => PlanDetailPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/plan-name',
      builder: (context, state) => const PlanNamePage(),
    ),
    GoRoute(
      path: '/plan-departure',
      builder: (context, state) => const PlanDeparturePage(),
    ),
    GoRoute(
      path: '/plan-arrival',
      builder: (context, state) => const PlanArrivalPage(),
    ),
    GoRoute(
      path: '/plan-ticket',
      builder: (context, state) => const PlanTicketPage(),
    ),
    GoRoute(
      path: '/plan-hotel',
      builder: (context, state) => const PlanHotelPage(),
    ),
    GoRoute(
      path: '/plan-note',
      builder: (context, state) => const PlanNotePage(),
    ),
  ],
);
