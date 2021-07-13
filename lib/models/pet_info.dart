import 'types_info.dart';

class PetInfo {
  final String description;
  final List<KeyValueData> characteristics;
  final List<AsPet> aspet;
  PetInfo({
    required this.description,
    required this.characteristics,
    required this.aspet,
  });
}

class AsPet {
  final String petname;
  final Pros pros;
  final Cons cons;
  AsPet({
    required this.petname,
    required this.pros,
    required this.cons,
  });
}

class Cons {
  final String key;
  final String data;
  Cons({
    required this.key,
    required this.data,
  });
}

class Pros {
  final String key;
  final String data;
  Pros({
    required this.key,
    required this.data,
  });
}

PetInfo petsinfo = PetInfo(
  description:
      'A pet is a domesticated animal that lives with an individual or family. There are popular, well-known pets like dogs and cats. Alternatively, there are less common pets sometimes called exotics such as snakes, turtles, and iguanas. Whether a pet is common or exotic, it can offer pleasure and joy to a household.',
  aspet: [
    AsPet(
      petname: 'Dogs',
      pros: Pros(
        key: 'Pros of Having a Dog As A Pet',
        data:
            'One of the pros of choosing this pet is there are hundreds of breeds of dogs to choose from so it’s easy to find the right fit your household.\nAnother pro is a dog can be a loyal companion that can guard your property as well.\nMany people appreciate the unconditional love offered by many pet dogs.',
      ),
      cons: Cons(
          key: 'Cons of Having a Dog As A Pet',
          data:
              'The high costs of vet care and food for a dog can put a strain on the household budget. This depends a lot on what breed of dog you choose.\nAnother con is some dogs shed more than others and can leave a lot of hair behind on the furniture. Be sure to check the shedding level of the dog breed you’re interested in if this is a concern.'),
    ),
    AsPet(
      petname: 'Cats',
      pros: Pros(
        key: 'Pros Of Having A Cat As A Pet',
        data:
            'Cats are low-maintenance pets in that they don’t need to be walked or taken to the park\nCats are quiet animals, so you don’t have to worry about excessive noise in your home\nThe monthly food bill for a cat is usually low because they aren’t known to need a large amount of food',
      ),
      cons: Cons(
        key: 'Cons of Having A Cat As A Pet',
        data:
            'A cat has sharp claws that can damage upholstery, rugs and other furniture\nMale cats can spray urine in an effort to mark their territory. This can happen inside a home creating a big stink. Cats that are neutered are less likely to spray the environment.\nA cat that’s kept outside should be monitored because these animals can easily be hit by a car if they wander out into the road',
      ),
    ),
    AsPet(
      petname: 'Birds',
      pros: Pros(
          key: 'Pros Of Having Birds as Pets',
          data:
              'Some birds can be taught to talk, sit on your finger and otherwise interact with family members\nBirds are colorful and fun to watch as they chatter with one another\nThe food costs for a bird are very low'),
      cons: Cons(
          key: 'Cons of Having Birds as Pets',
          data:
              'Birds can throw around a lot of seed requiring regular vacuuming and clean-up of the area\nSome birds squawk very loudly which can create a noisy household. Parrots can get especially loud if they feel they’re being ignored!\nBirds need to exercise outside of the cage and it may difficult to get them back into their habitat. It’s a good idea to train them to return to the cage with a special signal like shaking their box of food\nBirds can become sick if they are kept in a place that is exposed to cold drafts. They need special consideration during the cold weather months'),
    ),
    AsPet(
      petname: 'Fish',
      pros: Pros(
        key: 'Pros of Having Fish As Pets',
        data:
            'There are plenty of fish that are easy to care for and make a great first pet for a family\nSetting up and decorating a fish tank can be a fun, creative project for the whole family\nWhether it’s freshwater fish or a tropical fish, the options are endless!\nSetting up the right lighting for your aquarium can show off the colorful fins of your fish',
      ),
      cons: Cons(
          key: 'Cons Of Having Fish As Pets',
          data:
              'Some fish get sick very easily and can quickly pass germs to other fish in the tank causing them to die\nEmptying a large fish tank to clean it can be a hassle but is necessary to keep the fish healthy'),
    ),
    AsPet(
      petname: 'Rodents',
      pros: Pros(
        key: 'Pros of Having Rodents As Pets',
        data:
            'Hamsters, gerbils and other rodent pets are low-maintenance requiring less care than a larger pet.\nRodents are playful creatures that can be fun to interact with or simply observe. For instance, guinea pigs have been known to let out a squeal when they hear their owner’s voice!\nRodents and their cages are easy to move to other places in a home if you need to relocate it to another room',
      ),
      cons: Cons(
          key: 'Cons of Having Rodents As Pets',
          data:
              'Rodents can sometimes escape their cage or habitat making it necessary to find creative ways to catch them\nA rodent’s cage can take on an odor if you don’t establish a regular cleaning schedule\nIf you get a male and female gerbil, hamster, etc. without realizing it, you can end up with a cage full of babies!\nSome rodents like hamsters are nocturnal so they can make a lot of noise at night spinning on their wheel or digging in their bedding'),
    ),
  ],
  characteristics: [
    KeyValueData(
        key: 'Dependent on Humans to Live',
        value:
            'A pet needs to be given food, water, and shelter by its owner. Being domesticated means the animal depends on its owner for all of its care.'),
    KeyValueData(
        key: 'Lives in a Home ',
        value:
            'A pet lives in a home. Some pets such as parakeets and hamsters live in cages. Alternatively, dogs and cats wander freely around a home and may have their own bed to sleep in.'),
    KeyValueData(
        key: 'Needs a Veterinarian’s Care',
        value:
            'Pets need care from a veterinarian. The type of healthcare a pet needs depends on what type of pet it is. An iguana and a beagle need completely different types of vet care!'),
    KeyValueData(
        key: 'Some Pets Can Be Trained',
        value:
            ' A dog can learn how to sit, stay, and heel in a course of obedience training. Parrots can be taught to talk, and some cats can be taught by humans to do tricks.'),
    KeyValueData(
        key: 'Devoted to Its Owner',
        value:
            ' Pets are often devoted to their owners. They can establish a trust with their owner over time. In fact, some pets want to be with their owners 24/7!'),
    KeyValueData(
        key: 'Provides Companionship ',
        value: 'A pet is meant to be a companion to its owner.'),
    KeyValueData(
        key: 'Pets are Different from a Therapy Animal',
        value:
            ' A therapy animal receives specific training in order to provide support and care to its owner. As an example, some therapy dogs are trained to recognize the signs of a seizure in their owner. The dog responds by trying to get the person to a safe place. Alternatively, a pet is there strictly as a companion.'),
    KeyValueData(
        key: 'Different from a Farm Animal ',
        value:
            ' A cow or a chicken living on a farm serves a specific purpose. A cow provides milk while a chicken lays eggs to be eaten or sold. This makes farm animals a little different than traditional pets.'),
    KeyValueData(
        key: 'Can Be Common or Uncommon',
        value:
            'When you think of a pet you probably picture a dog, a cat, a bird, a fish, or a gerbil. Those are common choices for pets. Some people prefer less common or exotic pets such as snakes, iguanas, spiders, and ferrets. As long as an owner can offer appropriate care, many animals can live happily as pets.'),
    KeyValueData(
        key: 'Cannot Survive in the Wild',
        value:
            ' One of the main characteristics separating pets from other animals is a pet can’t survive in the wild. It has been domesticated or raised under a person’s care. So, releasing a pet snake into the wild doesn’t mean it will know how to find food or shelter. In fact, it will likely die.'),
  ],
);

class PetbyBreed {
  final String title;
  final String description;
  final String image;
  PetbyBreed({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<PetbyBreed> breedInfo = [
  PetbyBreed(
      title: 'Dogs Breeds',
      description:
          'Dogs are the domesticated descendants of the Wolf. They have either the scientific name of Canis familiaris (domestic dog) as a separate species or Canis lupus familiaris (domestic wolf dog) as a subspecies of the Wolf. Dogs are in the family Canidae, the dog-like carnivorans or canids, while the genus Canis means “dog” and includes wolves, dogs, coyotes and jackals. Their subfamily is Caninae, or canines, while their tribe is the dog-like or “true dog” tribe Canini and their sub-tribe is the wolf-like canids of Canina. Dogs are one of the first animals to be domesticated by prehistoric man.',
      image:
          'https://images.unsplash.com/photo-1518378188025-22bd89516ee2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
  PetbyBreed(
      image:
          'https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      title: 'Cats Breeds',
      description:
          'Cats, which are part of the Felidae family, are some of the smallest carnivores that are protected by humans. Their retractable claws are incredibly useful, allowing them to maintain their balance, catch their prey, and protect themselves from threats. One of the telltale signs of a domestic cat is found in their skull, showing off sharp canine teeth that they inherited from their wild ancestors. With heightened hearing and smell, even cute cats can be resourceful hunters. They are one of the first animals to be domesticated.'),
  PetbyBreed(
      title: 'Birds Breeds',
      description:
          "People looking for pet companionship who are allergic to more common pets like cats or dogs may want to consider a bird as a great alternative. If you choose the right breed pet birds can be friendly, gentle, and trainable.Though take care to research the best pet bird breeds before becoming a pet owner. Many people mistakenly believe smaller birds are less work. That may not be the case. While many birds can be quiet and gentle, that is not the case for all bird types. Many require more work than others. Some bird breeds can be rather vocal and disruptive to their environment.",
      image:
          'https://images.unsplash.com/photo-1499995909106-2d6741de64ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80'),
  PetbyBreed(
      title: 'Pet Fish',
      description:
          'Keeping fish as pets is a popular choice for many people. If you don’t have a lot of space or time to care for another type of pet like a dog or cat, a fish could be an excellent option. With their lower maintenance, tranquil presence, and low cost of ownership fish can be a ‘starter pet’ for children and young adults, or a long term pet for anyone that prefers less lower ongoing responsibility. Fish are also often more affordable than keeping dogs, cats, or birds and pets. ',
      image:
          "https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=356&q=80"), // PetbyBreed(

  PetbyBreed(
      title: 'Rodents Breeds',
      description:
          'Owning a pet rodent is an increasingly popular choice for people across the world, particularly families with young children. These animals are sometimes known as ‘pocket pets’, though not all pet rodents are small enough to actually fit in a pocket.Hamsters, guinea pigs, gerbils, and mice are the most popular choice for pet rodents. These are low maintenance animals that can live in a small to medium sized cage or glass aquarium. They are a good choice for young children or busy individuals who prefer low maintenance pets.Pet rodents do not live as long as more traditional pets like cats and dogs. Most will live less than five years, though some like the chinchilla can live beyond 10 years.',
      image:
          'https://images.unsplash.com/photo-1622728242786-5d1740ac17f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
  //     title: 'Exotic Breeds',
  //     description:
  //         'There is no single answer to ‘what is an exotic pet?’, but generally an exotic pet is considered an animal that is rare or uncommon, and may have unusual maintenance compared to other common animals like a dog or cat. Exotic pets are more likely to be wild animals that were caught and not bred in captivity to be domesticated.As certain types of animals become more common they may no longer be considered exotic. For example, some pet reptiles like snakes and some small rodents like hedgehogs were once considered rare but have increasingly gone mainstream as a type of pet and are now only borderline exotic. ',
  //     image:
  //         'https://images.unsplash.com/photo-1616398576477-346472230c1f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80'),
];
