import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/quotes/repository/quote_repository.dart';
import 'package:quotes_app/features/quotes/ui/HomeScreen.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("QuotesApp: Buildcontext");
    return RepositoryProvider(
      create: (context) => QuotesRepositpry(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
