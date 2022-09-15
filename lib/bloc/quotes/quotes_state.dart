part of 'quotes_bloc.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();
}

class QuotesLoadingState extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesErrorState extends QuotesState {
  final String message;
  const QuotesErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class QuotesLoadedState extends QuotesState {
  final QuoteModel model;
  const QuotesLoadedState(this.model);

  @override
  List<Object> get props => [model];
}
