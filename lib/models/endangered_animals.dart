import 'types_info.dart';
import 'package:flutter/cupertino.dart';

class EndangeredAnimalsType {
  final String type;
  final String intro;
  final String description;
  final String image;
  final List<KeyValueData> list;
  EndangeredAnimalsType({
    required this.type,
    required this.intro,
    required this.description,
    required this.image,
    required this.list,
  });
}

List<EndangeredAnimalsType> endangeredAnimalsType = [
  EndangeredAnimalsType(
    type: 'Extinct',
    intro:
        ' Extinct species no longer exist. After exhaustive research, scientists around the world agree that there isn’t a single living individual of the species on the planet.',
    description:
        'Extinct is a classification category on the International Union for the Conservation of Nature’s (IUCN) Threatened Species List.Extinction occurs when a species — also called “taxon” for the list — no longer exists anywhere on earth. When scientists have done extensive research and agree that there is no longer a single individual specimen of the species they declare it extinct. Essentially, extinction represents the termination of a taxon.\nThere are six main reasons why species become extinct:\nHabitat loss\nIntroduction of a foreign species\nHunting\nPollution\nDisease\nLoss of genetic variation\n\nHuman actions play a huge role in species extinction, but they’re not the only culprit. Incredibly, 99 percent of species that have ever lived on the planet have gone extinct. Typically, species have a lifespan of about 10 million years, but there are some that stick around for hundreds of millions. Take jellyfish; they have shimmied around the world’s oceans for about 550 million years! However, just because most animals eventually go extinct doesn’t mean we should not be concerned with their conservation status. When species are unnaturally dying out, to maintain the planet’s ecological balance, we must make an effort to ensure their survival.',
    image:
        'https://a-z-animals.com/media/animals/images/original/aurochs_4.jpg',
    list: [],
  ),
  EndangeredAnimalsType(
    description:
        ' Species that only survive in captivity, cultivation, or outside their native range are deemed “extinct in the wild.” For example, if only 10 individuals of a rare bird are left, and they all live in zoos or on a single nature preserve, the IUCN would classify the species as extinct in the wild.',
    image:
        'https://a-z-animals.com/media/animals/images/original/hawaiian_crow.jpg',
    intro:
        'Species that only survive in captivity, cultivation, or outside their native range are deemed “extinct in the wild.” ',
    type: 'Extinct In The Wild',
    list: [],
  ),
  EndangeredAnimalsType(
    description:
        'Critically endangered species are at a very high risk of becoming extinct in the wild or extinct. For an animal to be added to the category, it must meet any of the following criteria regarding population or habitat decline.',
    image:
        'https://a-z-animals.com/media/animals/images/original/amur_leopard_2.jpg',
    intro:
        'Critically endangered species are on the brink of becoming extinct or extinct in the wild but have not yet met the criteria for either category. ',
    type: 'Critically Endangered Species',
    list: [
      KeyValueData(
          key: 'Rapid Population Reduction',
          value:
              'A taxon’s population size is reduced by 90 percent or more over 10 years or three generations, whichever is longer, and the reduction causes are understood, reversible, and have stopped. For example, let’s pretend there’s a bird species that traditionally had a population of 2000. Over 10 years, it drops to 200 because a logging company demolished its habitat. If laws are put in place that bar the logging company from continuing to fell trees in the habitat, then the IUCN will list it as “critically endangered” because the reason for the decline is understood and ceased.\nA taxon’s population size is reduced by 80 percent or more over 10 years or three generations, whichever is longer, but the reduction cause may not be understood or reversible. For example, let’s say there’s a bird species that traditionally had a population size of 2000. Over 10 years, it drops to 400. However, scientists can’t figure out why they’re dying off. In this case, the IUCN would list it as “critically endangered” because the decimation is evident, but scientists can’t figure out why.\nA taxon’s population size is reduced by 80 percent or more over 10 years or three generations, whichever is longer, and the animal is also battling habitat shrinkage or another threat.'),
      KeyValueData(
          key: 'Geographic Reduction',
          value:
              'The area where a species can live is reduced to 100 square kilometers or less, or the area that the species currently and actually occupies is reduced to 10 square kilometers, and at least two of the following criteria are also met:\n\nThe population is known to exist in only one location.\nScientists observe or predict that the habitat will continue to shrink or be degraded, and there’s also a decline in subpopulations or the number of reproducing adults.\nScientists observe extreme fluctuations in the number of locations, subpopulations, or the number of reproducing adults.'),
      KeyValueData(
        key: 'Dangerously Low Number of Adults',
        value:
            'A taxon’s population only has 250 or fewer adults left, and a 25 percent decline is anticipated within three years or one generation, whichever is longer. If none of the taxon’s subpopulations contain more than 50 adults, or 90 percent of the species’ adults live in one subpopulation, it will qualify as critically endangered.\nScientists observe extreme fluctuations in the number of mature adults in a given population.\nScientists observe extreme fluctuations in the number of mature adults in a given population.',
      ),
      KeyValueData(
        key: 'Dangerously Low Overall Population Size',
        value: 'Only 50 or fewer individuals of a taxon remain.',
      ),
      KeyValueData(
        key: 'Expected Rapid Decline',
        value:
            'Research and studies indicate that there’s a 50 percent or greater chance that the taxon will be extinct in the wild within 10 years or three generations, whichever is longer.',
      ),
      KeyValueData(
        key: 'How many species are currently critically endangered?',
        value:
            'In the latest iteration of the list, 3,947 taxons — aka scientifically accepted units of species — are classified in the critically endangered category.',
      ),
    ],
  ),
  EndangeredAnimalsType(
    description:
        'Endangered species are at a very high risk of becoming extinct in the wild or extinct. In the most recent iteration of the list the IUCN identifies 5,766 species as endangered. For the IUCN to add a species to the category it must meet any of the following criteria',
    image:
        'https://a-z-animals.com/media/animals/images/original/african_elephant.jpg',
    intro:
        'Endangered species are at a very high risk of becoming extinct in the wild or extinct. For an animal to be added to the category, it must meet specific criteria regarding population or habitat decline.',
    type: 'Endangered Species',
    list: [
      KeyValueData(
        key: 'Population Reduction',
        value:
            'A taxon’s population size is reduced by 70 percent or more over 10 years or three generations, whichever is longer, and the reduction causes are understood, reversible, and have stopped. For example, let’s pretend there is a bird species that traditionally had a population of 2000. Over 10 years, it drops to 600 because a logging company demolished its habitat. If laws are put in place that bar the logging company from continuing to fell trees in the area, then the IUCN will list it as “endangered” because the reason for the decline is understood and ceased.\nA taxon’s population size is reduced by 50 percent or more over 10 years or three generations, whichever is longer, but the reduction cause may not be understood or reversible. For example, let’s say there is a bird species that traditionally had a population size of 2000. Over 10 years, it drops to 1000. However, scientists can’t figure out why they’re dying off. In this case, the IUCN would list it as “critically endangered” because the decimation is evident, but scientists can’t figure out why.\nA taxon’s population size is reduced by 50 percent or more over 10 years or three generations, whichever is longer, and the animal is also battling habitat shrinkage or another threat.',
      ),
      KeyValueData(
        key: 'Geographic Reduction',
        value:
            'The area where a species can live is reduced to 5,000 square kilometers or less, or the area that the species currently and actually occupies is reduced to 500 square kilometers, and at least two of the following criteria are also true:The population is known to exist in only one location.\nScientists observe or predict that the habitat will continue to shrink or be degraded, and there’s also a decline in subpopulations or the number of reproducing adults.\nScientists observe extreme fluctuations in the number of locations, subpopulations, or the number of reproducing adults.',
      ),
      KeyValueData(
        key: 'Dangerously Low Number of Adults',
        value:
            'A taxon’s population only has 2,500 or fewer adults left, and a 20 percent decline is anticipated within three years or one generation, whichever is longer. If no subpopulation of the taxon contains more than 250 adults, or 95 percent of the species’ adults live in one subpopulation, it will qualify as critically endangered\nScientists observe extreme fluctuations in the number of mature adults in a given population.',
      ),
      KeyValueData(
        key: 'Expected Rapid Decline',
        value:
            'Research and studies indicate that there is a 20 percent or greater chance that the species will be extinct in the wild within 20 years or five generations, whichever is longer.',
      ),
    ],
  ),
  EndangeredAnimalsType(
    description:
        'Vulnerable species are at risk of becoming extinct in the wild or extinct. The IUCN currently identifies over 10,000 species as vulnerable. For a species to be considered vulnerable it must meet any of the following criteria:',
    image:
        'https://a-z-animals.com/media/animals/images/original/asian_palm_civet.jpg',
    intro:
        'Vulnerable species meet at least one of the five Red List criteria. They’re considered to be at high risk of human-caused extinction if conservationists don’t intervene. For the IUCN to add a taxon to the Vulnerable animals list, it must meet specific criteria regarding population or habitat decline. ',
    type: 'Vulnerable Species',
    list: [
      KeyValueData(
        key: 'Population Reduction',
        value:
            'A taxon’s population size is reduced by 50 percent or more over 10 years or three generations, whichever is longer, and scientists understand that the reduction causes are reversible and have stopped. For example, let’s pretend there is a bird species that traditionally had a population of 2000. Over 10 years, it drops to 1000 because a logging company demolished its habitat. If lawmakers establish regulations that bar the logging company from continuing to fell trees in the area, then the IUCN will list the bird species as “endangered” because they understand the reason for the decline, and it is stopped.\nA taxon’s population size is reduced by 30 percent or more over 10 years or three generations, whichever is longer. However, conservationists don’t understand the reduction cause or know if it is reversible. For example, let’s say there is a bird species that traditionally had a population size of 2000. Over 10 years, it drops to 1400. Scientists, however, can’t figure out why they’re dying off. In this case, the IUCN would list it as “endangered” because the decimation is evident, but it can’t figure out why.\nA taxon’s population size is reduced by 30 percent or more over 10 years or three generations, whichever is longer, and the animal is also battling habitat shrinkage or another threat.',
      ),
      KeyValueData(
        key: 'Geographic Reduction',
        value:
            'The area where a species can live is reduced to 20,000 square kilometers or less, or the area where it currently and actually occupies is reduced to 2,000 square kilometers, and at least two of the following criteria are also true:\nThe population is not known to exist at more than 10 locations.\nScientists observe or predict that the habitat in question will continue to shrink or be degraded, and there’s also a decline in subpopulations or the number of reproducing adults.\nScientists observe extreme fluctuations in the number of locations, subpopulations, or the number of reproducing adults.',
      ),
      KeyValueData(
        key: 'Dangerously Low Number of Adults',
        value:
            'A taxon’s population only has 10,000 or fewer adults left, and a 10 percent decline is anticipated within 10 years or three generations, whichever is longer. If none of the taxon’s subpopulations contain more than 1,000 adults, or all the adults live in one subpopulation.\nScientists observe extreme fluctuations in the number of mature adults in a taxon’s population.',
      ),
      KeyValueData(
        key: 'Dangerously Low Overall Population Size',
        value:
            'Only 1,000 or fewer individuals of a taxon remain.\n\nA population with a viable but restricted habitat area is vulnerable to human activities within a very short period and thus may become critically endangered or extinct in the near future.',
      ),
      KeyValueData(
        key: 'Expected Rapid Decline',
        value:
            'Research indicates that there’s a 10 percent or greater chance that the taxon will be extinct in the wild within 100 years',
      ),
    ],
  ),
  EndangeredAnimalsType(
    description:
        'Near Threatened is a classification category on the International Union for the Conservation of Nature’s (IUCN) Threatened Species List. Currently 2,657 species are defined as near threatened. Scientists categorize a species as Near Threatened when conservationists believe that it will face extinction in the near future, but it doesn’t currently meet the standards for another category.\nThere are six main reasons why scientists categorize taxons as near threatened:\nHabitat loss\nIntroduction of a foreign species\nHunting\nPollution\nDisease\nLoss of genetic variation',
    image: 'https://a-z-animals.com/media/2018/09/Gecko-on-stump.jpg',
    intro:
        'A species is considered Near Threatened when it doesn’t qualify as Critically Endangered, Endangered, or Vulnerable, but scientists believe it will reach one of those levels in the near future.',
    type: 'Near Threatened',
    list: [],
  ),
  EndangeredAnimalsType(
    description:
        'Least Concern is an animal classification established by the International Union for the Conservation. Species classified as “least concern” are not a focus of conservationists because they don’t appear to be facing any imminent threats. The IUCN will not add species to the Least Concern list unless scientists have evaluated them. Additionally, LC animals are not red-listed, but they still have a category,Currently, 14,033 species of animals are on the Least Concern list.',
    image: 'https://a-z-animals.com/media/2019/11/Bullfrog-close-up.jpg',
    intro:
        ' Species that fall into the Least Concern category are not presently facing any population or habitat declines. ',
    type: 'Least Concern',
    list: [],
  ),
  EndangeredAnimalsType(
    description:
        ' Data deficient species lack enough information to properly categorize into one of the groups above',
    image: 'https://a-z-animals.com/media/Arapaima-1.jpg',
    intro:
        ' Data deficient species lack enough information to properly categorize into one of the groups above',
    type: 'Data Deficient',
    list: [],
  ),
  EndangeredAnimalsType(
    description:
        'This species has not been evaluated for an IUCN categorization yet. ',
    image: 'https://a-z-animals.com/media/2020/01/Abyssinian-close-up.jpg',
    intro:
        'This species has not been evaluated for an IUCN categorization yet. ',
    type: 'Not Evaluated',
    list: [],
  ),
];
