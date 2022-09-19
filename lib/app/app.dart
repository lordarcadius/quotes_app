import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';
import '../features/quotes/repository/quote_repository.dart';
import '../features/quotes/ui/home_screen.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key, required this.isDark}) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    debugPrint("QuotesApp: Buildcontext");
    return RepositoryProvider(
      create: (context) => QuotesRepository(),
      child: BlocProvider(
        create: (context) => ThemeBloc(isDark),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
