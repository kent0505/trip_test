import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../plans/bloc/plan_bloc.dart';
import '../../plans/pages/plans_page.dart';
import '../../settings/settings_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PlanBloc>().add(GetPlansEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return const PlansPage();
                } else {
                  return const SettingsPage();
                }
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}
