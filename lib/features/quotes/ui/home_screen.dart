import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/quotes/quotes_bloc.dart';
import '../../../bloc/theme/theme_bloc.dart';
import '../../../helpers/app_theme.dart';
import 'widgets/quote_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void storePref(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("HomeScreen build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const Text('Quotes'),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      if (state.isDark) {
                        BlocProvider.of<ThemeBloc>(context).add(
                            const ChangeThemeEvent(
                                theme: AppTheme.lightTheme, isDark: false));
                        storePref("isDark", false);
                      } else {
                        BlocProvider.of<ThemeBloc>(context).add(
                            const ChangeThemeEvent(
                                theme: AppTheme.darkTheme, isDark: true));
                        storePref("isDark", true);
                      }
                    },
                    icon: Icon(Icons.mode_night));
              },
            ),
          ],
        ),
      ),
      body: BlocProvider<QuotesBloc>(
        create: (context) =>
            QuotesBloc(RepositoryProvider.of(context))..add(LoadQuotesEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<QuotesBloc, QuotesState>(
              builder: (context, state) {
                if (state is QuotesErrorState) {
                  return Text(
                    state.message,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  );
                } else if (state is QuotesLoadedState) {
                  return QuoteWidget(
                      model: state.model,
                      onPressed: () =>
                          context.read<QuotesBloc>().add(LoadQuotesEvent()));
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }
}
