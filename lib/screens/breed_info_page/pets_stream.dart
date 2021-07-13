import 'dart:async';
import 'dart:io';

import '../../models/animal_model.dart';
import '../../repo/fetch_type_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetsStream {
  final repo = FetchTypeInfo();
  StreamController<List<Animals>> controller =
      StreamController<List<Animals>>();

  Stream<List<Animals>> get movieStream => controller.stream;

  getlist(String name, DocumentSnapshot? doc) async {
    try {
      final docs = await repo.getPetsList(name);
      controller.add(docs.list);
    } catch (e) {
      print(e.toString());
    }
  }
}
