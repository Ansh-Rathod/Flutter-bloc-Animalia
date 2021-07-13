part of 'get_pets_bloc.dart';

@immutable
abstract class GetPetsState {}

class GetPetsInitial extends GetPetsState {}

class GetPetsloaded extends GetPetsState {
  final List<Animals> animals;
  GetPetsloaded({
    required this.animals,
  });
}

class GetPetsError extends GetPetsState {
  final String error;
  GetPetsError({
    required this.error,
  });
}

class GetPetsloading extends GetPetsState {}
