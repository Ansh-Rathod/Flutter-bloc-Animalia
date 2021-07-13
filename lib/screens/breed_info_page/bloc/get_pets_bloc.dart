import 'dart:async';

import '../../../models/animal_model.dart';
import '../../../repo/fetch_type_info.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_pets_event.dart';
part 'get_pets_state.dart';

class GetPetsBloc extends Bloc<GetPetsEvent, GetPetsState> {
  GetPetsBloc() : super(GetPetsInitial());
  final repo = FetchTypeInfo();

  @override
  Stream<GetPetsState> mapEventToState(
    GetPetsEvent event,
  ) async* {
    if (event is LoadAnimalInfo) {
      try {
        yield GetPetsloading();
        final similarAnimals = await repo.getPetsList(event.name);
        yield GetPetsloaded(animals: similarAnimals.list..shuffle());
      } catch (e) {
        print(e.toString());
        yield GetPetsError(error: e.toString());
      }
    }
  }
}
