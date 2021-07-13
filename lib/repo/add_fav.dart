import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  Future addFavorite(String name, String image, String id) async {
    await FirebaseFirestore.instance
        .collection('Favorite')
        .doc(id)
        .collection('Animals')
        .doc(name)
        .set({
      "name": name,
      "image": image,
    });
  }

  Future deleteFavorite(String name, String image, String id) async {
    await FirebaseFirestore.instance
        .collection('Favorite')
        .doc(id)
        .collection('Animals')
        .doc(name)
        .delete();
  }
}
