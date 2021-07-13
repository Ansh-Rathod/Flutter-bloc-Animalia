part of 'saved_cubit.dart';

class SavedState extends Equatable {
  final bool isSaved;
  const SavedState(
    this.isSaved,
  );
  factory SavedState.initial() {
    return SavedState(
      false,
    );
  }
  @override
  List<Object> get props => [isSaved];

  SavedState copyWith({
    bool? isSaved,
  }) {
    return SavedState(
      isSaved ?? this.isSaved,
    );
  }
}
