import 'package:cloud_firestore/cloud_firestore.dart';

class Animals {
  final String url;
  final String name;
  final String animalclass;
  final String slogan;
  final String sciname;
  Animals({
    required this.url,
    required this.name,
    required this.animalclass,
    required this.slogan,
    required this.sciname,
  });
  factory Animals.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Animals(
      url: doc.data()['image'] ??
          "https://images.pexels.com/photos/4439425/pexels-photo-4439425.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      name: doc.data()['name'] ?? "",
      animalclass: doc.data()['class'] ?? "",
      slogan: doc.data()['slogan'] ?? "",
      sciname: doc.data()['scientificname'] ?? "",
    );
  }
}

class AnimalsList {
  final List<Animals> list;
  AnimalsList({
    required this.list,
  });
  factory AnimalsList.fromDoc(QuerySnapshot<Map<String, dynamic>> doc) {
    return AnimalsList(
        list: doc.docs.map((all) => Animals.fromDoc(all)).toList());
  }
}

class AnimalSearchName {
  final String name;
  final String image;
  AnimalSearchName({
    required this.name,
    required this.image,
  });
}

List<AnimalSearchName> animalSearchName = [
  AnimalSearchName(
    name: "African Tree Toad",
    image:
        "https://a-z-animals.com/media/animals/images/original/african_tree_toad-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Albatross",
    image: "https://a-z-animals.com/media/albatross-5-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Octopus",
    image:
        "https://a-z-animals.com/media/animals/images/original/octopus1-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Chimaera",
    image: "https://a-z-animals.com/media/Chimaera-1-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Snail",
    image: "https://a-z-animals.com/media/2019/11/Snail-header-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Beetle",
    image:
        "https://a-z-animals.com/media/animals/images/original/beetle-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Abyssinian",
    image:
        "https://a-z-animals.com/media/2020/01/Abyssinian-header-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Bearded Dragon",
    image:
        "https://a-z-animals.com/media/animals/images/original/dragon1-400x300.jpg",
  ),
  AnimalSearchName(
    name: "Aldabra Giant Tortoise",
    image:
        "https://a-z-animals.com/media/animals/images/original/aldabra_giant_tortoise-400x300.jpg",
  ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
  // AnimalSearchName(
  //   name: "",
  //   image: "",
  // ),
];
