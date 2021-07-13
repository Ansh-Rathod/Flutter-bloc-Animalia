import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:animalapp/repo/add_fav.dart';
import 'package:animalapp/repo/device_repo.dart';
import 'package:animalapp/screens/favorite_animals/favrite_animals.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedState.initial());
  final deviceRepo = DeviceInfoRepo();
  final favRepo = Favorite();
  void init(String name) async {
    var id = await deviceRepo.deviceDetails();

    await FirebaseFirestore.instance
        .collection('Favorite')
        .doc(id)
        .collection('Animals')
        .doc(name)
        .get()
        .then((value) {
      if (value.exists) {
        emit(state.copyWith(isSaved: true));
      } else {
        emit(state.copyWith(isSaved: false));
      }
    });
  }

  void like(String name, String image) async {
    var id = await deviceRepo.deviceDetails();

    if (!state.isSaved) {
      emit(state.copyWith(isSaved: true));

      favRepo.addFavorite(name, image, id);
    } else {
      emit(state.copyWith(isSaved: false));
      favRepo.deleteFavorite(name, image, id);
    }
  }
}
