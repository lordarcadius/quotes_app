import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/theme/theme_bloc.dart';
import 'package:quotes_app/features/quotes/repository/quote_repository.dart';
import 'package:quotes_app/features/quotes/ui/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  Future<bool> readPref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    if (value == null) {
      print("quoteDebug: null");
      return false;
    } else {
      print("quoteDebug: not null: $value");
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("QuotesApp: Buildcontext");
    return RepositoryProvider(
      create: (context) => QuotesRepository(),
      child: BlocProvider(
        create: (context) => ThemeBloc(true),
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
