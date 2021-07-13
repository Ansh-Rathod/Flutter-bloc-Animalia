import 'package:cloud_firestore/cloud_firestore.dart';

class Typeinfo {
  final String intro;
  final String info1;
  final String info1about;
  final String info2;
  final List characteristics;
  final List info2about;
  Typeinfo({
    required this.intro,
    required this.info1,
    required this.info1about,
    required this.info2,
    required this.characteristics,
    required this.info2about,
  });

  factory Typeinfo.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Typeinfo(
      characteristics: (doc.data()!['characteristics'] as List)
          .map((data) => KeyValueData.fromdoc(data))
          .toList(),
      info1: doc.data()!['info1'],
      info1about: doc.data()!['info1about'],
      info2: doc.data()!['info2'],
      info2about: (doc.data()!['info2about'] as List)
          .map((data) => KeyValueData.fromdoc(data))
          .toList(),
      intro: doc.data()!['lead'],
    );
  }
}

class KeyValueData {
  final String key;
  final String value;
  KeyValueData({
    required this.key,
    required this.value,
  });
  factory KeyValueData.fromdoc(doc) {
    return new KeyValueData(
        key: doc['key'] ?? doc['title'],
        value: doc['value'] ?? doc['description']);
  }
}
