import 'dart:async';

import '../../../models/animal_info_model.dart';
import '../../../models/animal_model.dart';
import '../../../repo/animal_info.dart';
import '../../../repo/fetch_type_info.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animals_info_event.dart';
part 'animals_info_state.dart';

class AnimalsInfoBloc extends Bloc<AnimalsInfoEvent, AnimalsInfoState> {
  AnimalsInfoBloc() : super(AnimalsInfoInitial());
  final repo = GetAnimalInfo();
  final similarAnimalsRepo = FetchTypeInfo();
  @override
  Stream<AnimalsInfoState> mapEventToState(
    AnimalsInfoEvent event,
  ) async* {
    if (event is LoadAnimalInfo) {
      try {
        yield AnimalsInfoloading();
        AnimalsList? similarAnimals;
        final data = await repo.getAnimalInfo(event.name);
        if (data.feilds.contains('Class')) {
          similarAnimals =
              await similarAnimalsRepo.getsimilarAnimalsListByClass(
            data.doc.data()!['class'],
          );
        }
        yield AnimalsInfoloaded(
            info: data,
            animals: similarAnimals == null ? [] : similarAnimals.list
              ..shuffle());
      } catch (e) {
        print(e.toString());
        yield AnimalsInfoError(error: e.toString());
      }
    }
  }
}
