class AnimalsType {
  final String title;
  final String description;
  final String image;
  AnimalsType(
    this.title,
    this.description,
    this.image,
  );
}

class AnimalTypeList {
  List<AnimalsType> animalsType = [
    AnimalsType(
      "Mammals",
      "Animals that are considered mammals include warm-blooded vertebrates that have hair or fur and whose babies drink milk.",
      "https://images.unsplash.com/photo-1446082488256-bfc5e2b5f95c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    ),
    AnimalsType(
      "Reptiles",
      "Lizards, dinosaurs, crocodiles, turtles, and snakes – all belong to that ancient and stout class of animals known as the reptiles..",
      "https://images.unsplash.com/photo-1619203922058-7c42019fdd37?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    ),
    AnimalsType(
      "Fish",
      "Fish are aquatic vertebrates. They usually have gills, paired fins, a long body covered with scales, and tend to be cold-blooded.",
      "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    ),
    AnimalsType(
      "Birds",
      "Birds, members of the class Aves, include more than 10,400 living species.",
      "https://images.unsplash.com/photo-1549608276-5786777e6587?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    ),
    AnimalsType(
      "Amphibians",
      "To have the classification of an amphibian, an animal must be a vertebrate, require water to survive, be cold-blooded, and spend time both on land and in water.",
      "https://images.unsplash.com/photo-1551430692-c402f501a6d0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=602&q=80",
    ),
    AnimalsType(
      "Invertebrates",
      "The definition of an invertebrate is any animal that does not have a backbone or vertebral column.",
      "https://images.unsplash.com/photo-1533675160726-0edbdd86d8aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
    ),
    AnimalsType(
      "Insects",
      "All insects are part of the taxonomical phylum Arthropoda, and they are collectively referred to as arthropods. ",
      "https://images.unsplash.com/photo-1611938379184-0d665c853ca1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
    ),
  ];
}

class PopularAnimals {
  final String url;
  final String tagline;
  final String name;
  PopularAnimals(
    this.url,
    this.tagline,
    this.name,
  );
}

List<PopularAnimals> popularAnimals = [
  PopularAnimals(
    "https://images.unsplash.com/photo-1552410260-0fd9b577afa6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "Lives in small groups called prides!",
    "Lion",
  ),
  PopularAnimals(
    "https://images.unsplash.com/photo-1557692538-9564c4b2cd13?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80",
    "Prefers to hunt at night than during the day!",
    "Panther",
  ),
  PopularAnimals(
      "https://images.unsplash.com/photo-1456926631375-92c8ce872def?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "The Amur leopard may be the rarest big cat on Earth!",
      "Amur Leopard"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1593946460607-d1570da6268f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "Could be extinct within the next 30 years!",
      "Polar Bear"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1503066211613-c17ebc9daef0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "None have been seen in the wild for 50 years!",
      "White Tiger"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1574007477600-91e318b24ccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "Thought to date back more than 300,000 years!",
      "Wolf"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1603408948770-75f972b826e3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "Some species have a poisonous bite!",
      "Millipede"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1571775300229-7e84bff45eae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "Extremely thick winter fur!",
      "Arctic Fox"),
  PopularAnimals(
      "https://images.unsplash.com/photo-1463501810073-6e31c827a9bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "It's horns are made from keratin!",
      "Rhinoceros"),
];
List<PopularAnimals> popularPets = [
  PopularAnimals(
    "https://a-z-animals.com/media/2020/01/Abyssinian-playing.jpg",
    "Mammalia",
    "Abyssinian",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/2019/10/shutterstock_683085220.jpg",
    "Very intelligent, independent and strong-minded!",
    "Airedale Terrier",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/2019/10/shutterstock_1176165853.jpg",
    "Often used as a guard dog!",
    "Akbash",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/2019/11/Russian-Blue-on-couch.jpg",
    "First brought to the UK in the 1800s!",
    "Russian Blue",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/animals/images/original/rottweiler1.jpg",
    "Strong, loyal and self-assured!",
    "Rottweiler",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/2021/05/Russian-Bear-Dog-in-snow.jpg",
    "",
    "Russian Bear Dog",
  ),
  PopularAnimals(
    "https://a-z-animals.com/media/2021/04/Wheaten-Terrier-lying.jpg",
    "",
    "Wheaten Terrier",
  ),
];
