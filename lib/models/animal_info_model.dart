import 'package:cloud_firestore/cloud_firestore.dart';

import 'types_info.dart';

class AnimalInfo {
  final String name;
  final List images;
  final List information;
  final List feilds;
  final DocumentSnapshot<Map<String, dynamic>> doc;
  AnimalInfo({
    required this.name,
    required this.images,
    required this.information,
    required this.feilds,
    required this.doc,
  });
  factory AnimalInfo.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return AnimalInfo(
      feilds: doc.data()!['feilds'],
      images: doc.data()!['imageData'],
      information: (doc.data()!['information'] as List)
          .map((list) => KeyValueData.fromdoc(list))
          .toList()
            ..shuffle(),
      doc: doc,
      name: doc.data()!['name'],
    );
  }
}
