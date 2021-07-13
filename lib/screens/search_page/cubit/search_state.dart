part of 'search_cubit.dart';

class SearchState extends Equatable {
  final String query;
  SearchState({
    required this.query,
  });
  factory SearchState.initial() {
    return SearchState(
      query: '',
    );
  }

  @override
  List<Object> get props => [query];

  SearchState copyWith({
    String? query,
  }) {
    return SearchState(
      query: query ?? this.query,
    );
  }
}
