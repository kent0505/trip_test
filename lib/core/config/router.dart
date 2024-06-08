import 'package:go_router/go_router.dart';

import '../../features/plans/models/plan.dart';
import '../../features/plans/pages/add/add_departure_page.dart';
import '../../features/plans/pages/add/add_hotel_page.dart';
import '../../features/plans/pages/add/add_name_page.dart';
import '../../features/plans/pages/add/add_arrival_page.dart';
import '../../features/plans/pages/add/add_note_page.dart';
import '../../features/plans/pages/add/add_ticket_page.dart';
import '../../features/plans/pages/edit/edit_arrival_page.dart';
import '../../features/plans/pages/edit/edit_departure_page.dart';
import '../../features/plans/pages/edit/edit_hotel_page.dart';
import '../../features/plans/pages/edit/edit_name_page.dart';
import '../../features/plans/pages/edit/edit_note_page.dart';
import '../../features/plans/pages/edit/edit_ticket_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/splash/onboarding_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/plans/pages/plan_detail_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/home',
  routes: [
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
      routes: [
        GoRoute(
          path: 'plan-detail',
          builder: (context, state) => PlanDetailPage(
            plan: state.extra as Plan,
          ),
        ),
      ],
    ),
    // add
    GoRoute(
      path: '/add-name',
      builder: (context, state) => const AddNamePage(),
    ),
    GoRoute(
      path: '/add-departure',
      builder: (context, state) => AddDeparturePage(
        name: state.extra as String,
      ),
    ),
    GoRoute(
      path: '/add-arrival',
      builder: (context, state) => AddArrivalPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/add-ticket',
      builder: (context, state) => AddTicketPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/add-hotel',
      builder: (context, state) => AddHotelPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/add-note',
      builder: (context, state) => AddNotePage(
        plan: state.extra as Plan,
      ),
    ),
    // edit
    GoRoute(
      path: '/edit-name',
      builder: (context, state) => EditNamePage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/edit-departure',
      builder: (context, state) => EditDeparturePage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/edit-arrival',
      builder: (context, state) => EditArrivalPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/edit-ticket',
      builder: (context, state) => EditTicketPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/edit-hotel',
      builder: (context, state) => EditHotelPage(
        plan: state.extra as Plan,
      ),
    ),
    GoRoute(
      path: '/edit-note',
      builder: (context, state) => EditNotePage(
        plan: state.extra as Plan,
      ),
    ),
  ],
);
