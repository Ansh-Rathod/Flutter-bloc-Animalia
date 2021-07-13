part of 'endangered_animal_bloc.dart';

@immutable
abstract class EndangeredAnimalState {}

class EndangeredAnimalInitial extends EndangeredAnimalState {}

class EndangeredAnimalloaded extends EndangeredAnimalState {
  final List<Animals> animals;
  EndangeredAnimalloaded({
    required this.animals,
  });
}

class EndangeredAnimalError extends EndangeredAnimalState {
  final String error;
  EndangeredAnimalError({
    required this.error,
  });
}

class EndangeredAnimalloading extends EndangeredAnimalState {}
