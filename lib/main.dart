import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/plans/bloc/plan_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => PlanBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
