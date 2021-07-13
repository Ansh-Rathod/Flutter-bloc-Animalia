part of 'get_pets_bloc.dart';

@immutable
abstract class GetPetsEvent {}

class LoadAnimalInfo extends GetPetsEvent {
  final String name;
  LoadAnimalInfo({
    required this.name,
  });
}
