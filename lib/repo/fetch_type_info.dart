import '../models/animal_model.dart';
import '../models/types_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchTypeInfo {
  final firebase = FirebaseFirestore.instance;

  Future<Typeinfo> getTypeInfo(String docname) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firebase.collection('Info').doc(docname).get();
    return Typeinfo.fromDoc(doc);
  }

  Future<AnimalsList> getAnimalsList(String name) async {
    final QuerySnapshot<Map<String, dynamic>> doc =
        await firebase.collection(name).limit(6).get();
    return AnimalsList.fromDoc(doc);
  }

  Future<AnimalsList> getsimilarAnimalsListByClass(String name) async {
    final QuerySnapshot<Map<String, dynamic>> doc = await firebase
        .collection('Class')
        .doc(name)
        .collection("Animals")
        .limit(6)
        .get();
    return AnimalsList.fromDoc(doc);
  }

  Future<AnimalsList> getEndangeredAnimalsList(String name) async {
    final QuerySnapshot<Map<String, dynamic>> doc = await firebase
        .collection('Endangered animal')
        .doc(name)
        .collection("Animals")
        .limit(6)
        .get();
    return AnimalsList.fromDoc(doc);
  }

  Future<AnimalsList> getPetsList(String name) async {
    final QuerySnapshot<Map<String, dynamic>> doc = await firebase
        .collection('Pets')
        .doc(name)
        .collection("Animals")
        .limit(10)
        .get();
    return AnimalsList.fromDoc(doc);
  }

  Future<List> getClasssAfterList(String name, DocumentSnapshot? dc) async {
    if (dc == null) {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Class')
          .doc(name)
          .collection("Animals")
          .limit(30)
          .get();
      return [AnimalsList.fromDoc(doc), doc.docs[doc.docs.length - 1]];
    } else {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Class')
          .doc(name)
          .collection("Animals")
          .startAfterDocument(dc)
          .limit(30)
          .get();
      return [
        AnimalsList.fromDoc(doc),
        doc.docs.length != 0 ? doc.docs[doc.docs.length - 1] : null
      ];
    }
  }

  Future<List> getBreedAfterList(String name, DocumentSnapshot? dc) async {
    if (dc == null) {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Pets')
          .doc(name)
          .collection("Animals")
          .limit(30)
          .get();
      return [AnimalsList.fromDoc(doc), doc.docs[doc.docs.length - 1]];
    } else {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Pets')
          .doc(name)
          .collection("Animals")
          .startAfterDocument(dc)
          .limit(30)
          .get();
      return [
        AnimalsList.fromDoc(doc),
        doc.docs.length != 0 ? doc.docs[doc.docs.length - 1] : null
      ];
    }
  }

  Future<List> getAllEndangeredAnimals(
      String name, DocumentSnapshot? dc) async {
    if (dc == null) {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Endangered animal')
          .doc(name)
          .collection("Animals")
          .limit(30)
          .get();
      return [AnimalsList.fromDoc(doc), doc.docs[doc.docs.length - 1]];
    } else {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection('Endangered animal')
          .doc(name)
          .collection("Animals")
          .startAfterDocument(dc)
          .limit(30)
          .get();
      return [
        AnimalsList.fromDoc(doc),
        doc.docs.length != 0 ? doc.docs[doc.docs.length - 1] : null
      ];
    }
  }

  Future<List> getTypeAnimalsAfterList(
      String name, DocumentSnapshot? dc) async {
    if (dc == null) {
      final QuerySnapshot<Map<String, dynamic>> doc =
          await firebase.collection(name).limit(30).get();
      return [AnimalsList.fromDoc(doc), doc.docs[doc.docs.length - 1]];
    } else {
      final QuerySnapshot<Map<String, dynamic>> doc = await firebase
          .collection(name)
          .startAfterDocument(dc)
          .limit(30)
          .get();
      return [
        AnimalsList.fromDoc(doc),
        doc.docs.length != 0 ? doc.docs[doc.docs.length - 1] : null
      ];
    }
  }
}
