import 'dart:async';

import '../../../models/animal_model.dart';
import '../../../repo/fetch_type_info.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'endangered_animal_event.dart';
part 'endangered_animal_state.dart';

class EndangeredAnimalBloc
    extends Bloc<EndangeredAnimalEvent, EndangeredAnimalState> {
  EndangeredAnimalBloc() : super(EndangeredAnimalInitial());
  final repo = FetchTypeInfo();
  @override
  Stream<EndangeredAnimalState> mapEventToState(
    EndangeredAnimalEvent event,
  ) async* {
    if (event is LoadAnimalInfo) {
      try {
        yield EndangeredAnimalloading();
        final similarAnimals = await repo.getEndangeredAnimalsList(event.name);
        yield EndangeredAnimalloaded(animals: similarAnimals.list..shuffle());
      } catch (e) {
        print(e.toString());
        yield EndangeredAnimalError(error: e.toString());
      }
    }
  }
}
