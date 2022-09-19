import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/theme/theme_bloc.dart';
import 'package:quotes_app/features/quotes/repository/quote_repository.dart';
import 'package:quotes_app/features/quotes/ui/HomeScreen.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("QuotesApp: Buildcontext");
    return RepositoryProvider(
      create: (context) => QuotesRepository(),
      child: BlocProvider(
        create: (context) => ThemeBloc(),
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
