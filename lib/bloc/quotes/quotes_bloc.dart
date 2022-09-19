import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/quotes/repository/quote_repository.dart';
import '../../models/models.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository _quotesRepositpry;

  QuotesBloc(this._quotesRepositpry) : super(QuotesLoadingState()) {
    on<LoadQuotesEvent>((event, emit) async {
      emit(QuotesLoadingState());
      try {
        final model = await _quotesRepositpry.getQuote();
        emit(QuotesLoadedState(model));
      } catch (e) {
        emit(QuotesErrorState(e.toString()));
      }
    });
  }
}
