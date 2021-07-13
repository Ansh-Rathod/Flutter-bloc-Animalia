part of 'types_info_bloc.dart';

@immutable
abstract class TypesInfoState {}

class TypesInfoInitial extends TypesInfoState {}

class TypesInfoloaded extends TypesInfoState {
  final Typeinfo info;
  final List<Animals> animals;
  TypesInfoloaded({
    required this.info,
    required this.animals,
  });
}

class TypesInfoError extends TypesInfoState {
  final String error;
  TypesInfoError({
    required this.error,
  });
}

class TypesInfoloading extends TypesInfoState {}
