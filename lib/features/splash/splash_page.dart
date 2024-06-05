import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import 'widgets/logo_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _init() async {
    await getData().then(
      (value) {
        Future.delayed(const Duration(seconds: 1), () {
          if (onboarding) {
            log('onboarding');
            context.go('/onboarding');
          } else {
            log('home');
            context.go('/home');
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}
