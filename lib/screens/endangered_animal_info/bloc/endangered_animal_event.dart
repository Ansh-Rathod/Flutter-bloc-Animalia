part of 'endangered_animal_bloc.dart';

@immutable
abstract class EndangeredAnimalEvent {}

class LoadAnimalInfo extends EndangeredAnimalEvent {
  final String name;
  LoadAnimalInfo({
    required this.name,
  });
}
