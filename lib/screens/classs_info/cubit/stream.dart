import 'dart:async';

import 'package:animalapp/models/animal_model.dart';
import 'package:animalapp/repo/fetch_type_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetAnimals {
  final StreamController<List<Animals>> controller =
      StreamController<List<Animals>>();
  final repo = FetchTypeInfo();
  var snp;
  var isfinish = false;
  List<Animals> animals = [];
  void addData(String name) async {
    final animalss = await repo.getClasssAfterList(name, null);
    controller.sink.add(animalss[0].list);
    snp = animalss[1];
    animals.addAll(animalss[0].list);
  }

  void getNextAnimals(DocumentSnapshot doc, String name) async {
    final animalss = await repo.getClasssAfterList(name, doc);
    animals.addAll(animalss[0].list);
    controller.sink.add(animals);
    if (animalss[1] != null) {
      snp = animalss[1];
    } else {
      isfinish = true;
    }
  }

  void dispose() {
    controller.close();
  }
}
