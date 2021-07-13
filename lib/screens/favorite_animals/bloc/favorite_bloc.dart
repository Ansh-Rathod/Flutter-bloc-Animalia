import 'dart:async';

import 'package:animalapp/repo/device_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial());

  final deviceRepo = DeviceInfoRepo();
  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is LoadFavorite) {
      try {
        yield FavoriteLoading();
        var id = await deviceRepo.deviceDetails();
        final stream = FirebaseFirestore.instance
            .collection('Favorite')
            .doc(id)
            .collection('Animals')
            .snapshots();
        yield FavoriteLoaded(stream: stream);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
