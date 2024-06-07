import 'package:go_router/go_router.dart';

import '../../features/plans/models/plan.dart';
import '../../features/plans/pages/add/add_departure_page.dart';
import '../../features/plans/pages/add/add_hotel_page.dart';
import '../../features/plans/pages/add/add_name_page.dart';
import '../../features/plans/pages/add/add_arrival_page.dart';
import '../../features/plans/pages/add/add_note_page.dart';
import '../../features/plans/pages/add/add_ticket_page.dart';
import '../../features/plans/pages/edit/edit_hotel_page.dart';
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
    // add
    GoRoute(
      path: '/add-name',
      builder: (context, state) => const AddNamePage(),
    ),
    GoRoute(
      path: '/add-departure',
      builder: (context, state) => const AddDeparturePage(),
    ),
    GoRoute(
      path: '/add-arrival',
      builder: (context, state) => const PlanArrivalPage(),
    ),
    GoRoute(
      path: '/add-ticket',
      builder: (context, state) => const AddTicketPage(),
    ),
    GoRoute(
      path: '/add-hotel',
      builder: (context, state) => const AddHotelPage(),
    ),
    GoRoute(
      path: '/add-note',
      builder: (context, state) => const AddNotePage(),
    ),
    // edit
    GoRoute(
      path: '/edit-hotel',
      builder: (context, state) => EditHotelPage(
        plan: state.extra as Plan,
      ),
    ),
  ],
);
