import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/quotes/quotes_bloc.dart';
import 'package:quotes_app/bloc/theme/theme_bloc.dart';
import 'package:quotes_app/features/quotes/ui/widgets/quote_widget.dart';
import 'package:quotes_app/helpers/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                      } else {
                        BlocProvider.of<ThemeBloc>(context).add(
                            const ChangeThemeEvent(
                                theme: AppTheme.darkTheme, isDark: true));
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
