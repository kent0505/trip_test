import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/config/app_colors.dart';
import '../plans/pages/plans_page.dart';
import '../settings/settings_page.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return const PlansPage();
                } else {
                  return const SettingsPage();
                }
              },
            ),
          ),
          const _CustomNavBar(),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 83,
        color: AppColors.primaryWhite8,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 24),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  title: 'Plans',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  title: 'Settings',
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 40,
        width: 48,
        child: Column(
          children: [
            active
                ? SvgPicture.asset(
                    'assets/icons/${title.toLowerCase()}_active.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/${title.toLowerCase()}.svg',
                  ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: active ? AppColors.accent : AppColors.primaryWhite40,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
