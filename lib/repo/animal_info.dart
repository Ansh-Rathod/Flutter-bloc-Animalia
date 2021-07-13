import '../models/animal_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetAnimalInfo {
  final firebase = FirebaseFirestore.instance;

  Future<AnimalInfo> getAnimalInfo(String docname) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firebase.collection('Animals').doc(docname).get();
    return AnimalInfo.fromDoc(doc);
  }
}
