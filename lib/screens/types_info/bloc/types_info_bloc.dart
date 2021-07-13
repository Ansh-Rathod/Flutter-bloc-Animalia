import 'dart:async';

import '../../../models/animal_model.dart';
import '../../../models/types_info.dart';
import '../../../repo/fetch_type_info.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'types_info_event.dart';
part 'types_info_state.dart';

class TypesInfoBloc extends Bloc<TypesInfoEvent, TypesInfoState> {
  TypesInfoBloc() : super(TypesInfoInitial());
  final repo = FetchTypeInfo();
  @override
  Stream<TypesInfoState> mapEventToState(
    TypesInfoEvent event,
  ) async* {
    if (event is LoadTypeInfo) {
      try {
        yield TypesInfoloading();
        final data = await repo.getTypeInfo(event.name);
        final docs = await repo.getAnimalsList(event.name);
        yield TypesInfoloaded(info: data, animals: docs.list);
      } catch (e) {
        print(e.toString());
        yield TypesInfoError(error: e.toString());
      }
    }
  }
}
