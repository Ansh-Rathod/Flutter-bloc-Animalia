part of 'animals_info_bloc.dart';

@immutable
abstract class AnimalsInfoEvent {}

class LoadAnimalInfo extends AnimalsInfoEvent {
  final String name;
  LoadAnimalInfo({
    required this.name,
  });
}
