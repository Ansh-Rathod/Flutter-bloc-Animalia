part of 'animals_info_bloc.dart';

@immutable
abstract class AnimalsInfoState {}

class AnimalsInfoInitial extends AnimalsInfoState {}

class AnimalsInfoloaded extends AnimalsInfoState {
  final AnimalInfo info;
  final List<Animals> animals;
  AnimalsInfoloaded({
    required this.info,
    required this.animals,
  });
}

class AnimalsInfoError extends AnimalsInfoState {
  final String error;
  AnimalsInfoError({
    required this.error,
  });
}

class AnimalsInfoloading extends AnimalsInfoState {}
