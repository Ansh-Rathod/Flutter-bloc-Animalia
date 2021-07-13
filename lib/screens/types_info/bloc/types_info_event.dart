part of 'types_info_bloc.dart';

@immutable
abstract class TypesInfoEvent {}

class LoadTypeInfo extends TypesInfoEvent {
  final String name;
  LoadTypeInfo({
    required this.name,
  });
}
