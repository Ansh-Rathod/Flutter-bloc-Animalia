import 'package:animalapp/models/animal_model.dart';
import 'package:animalapp/screens/animal_info/animal_info.dart';
import 'package:animalapp/screens/animal_info/bloc/animals_info_bloc.dart';
import 'package:animalapp/screens/search_page/search_page.dart';
import 'package:animalapp/widgets/cubit/saved_cubit.dart';
import 'package:animalapp/widgets/loading_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/endangered_animals.dart';
import '../../models/pet_info.dart';
import '../../models/type_of_animals.dart';
import '../full_pets_info/full_pets_info.dart';
import '../../themes/theme.dart';
import '../../widgets/horizontal_list.dart';
import '../../widgets/my_carousel.dart';
import '../../widgets/type_of_animals.dart';
import '../../widgets/type_of_endangered_animals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AnimalTypeList types = AnimalTypeList();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Animalia",
              style: GoogleFonts.aclonica(
                color: Colors.greenAccent.shade400,
                fontSize: 20,
              )),
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Hello, ",
                    style: heading.copyWith(
                        color: Colors.grey.shade300, fontSize: 20),
                  ),
                  TextSpan(
                    text: "Welcome",
                    style: heading.copyWith(color: Colors.white, fontSize: 20),
                  )
                ]),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 4),
                  ...animalSearchName
                      .map((word) => ChipWidget(word.name, word.image))
                      .toList()
                        ..shuffle(),
                  SizedBox(width: 20),
                ],
              ),
            ),
            // MyCarousel(),
            SizedBox(height: 20),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "The 7 Major Types Of Animals.",
                style: heading.copyWith(color: Colors.white),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  for (var i = 0; i < types.animalsType.length; i++)
                    TypeofAnimals(
                      type: types.animalsType[i],
                      index: i,
                    ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "What makes an animal a pet?",
                style: heading.copyWith(color: Colors.white),
              ),
            ),
            PetsWidget(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: HorizontalList(
                  type: breedInfo[0],
                  index: 0,
                  pet: petsinfo.aspet[0],
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: HorizontalList(
                  type: breedInfo[1],
                  index: 1,
                  pet: petsinfo.aspet[1],
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Popular Animals",
                style: heading.copyWith(color: Colors.white),
              ),
            ),
            MyCarousel(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Endangered Animal Categories",
                style: heading.copyWith(color: Colors.white),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  for (var i = 0; i < endangeredAnimalsType.length; i++)
                    EndangeredAnimalTypeWidget(
                      type: endangeredAnimalsType[i],
                      index: i,
                    ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Popular Animals",
                style: heading.copyWith(color: Colors.white),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  for (var i = 0; i < popularPets.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => AnimalsInfoBloc()
                                          ..add(LoadAnimalInfo(
                                              name: popularPets[i].name)),
                                        child: AnimalsInfoPage(
                                          image: popularPets[i].url,
                                          title: popularPets[i].name,
                                          index: i,
                                        ),
                                      )));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                color: Colors.black.withOpacity(.3),
                                width: 240,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Hero(
                                      tag: popularPets[i].url +
                                          popularPets[i].name +
                                          i.toString(),
                                      child: CachedNetworkImage(
                                        imageUrl: popularPets[i].url,
                                        height: 140,
                                        width: 240,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          color: Colors.grey,
                                          height: 140,
                                          width: 240,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        popularPets[i].name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: title.copyWith(
                                          fontSize: 18,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Text(
                                        popularPets[i].tagline,
                                        maxLines: 2,
                                        style: normalText,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  child: BlocProvider(
                                    create: (context) =>
                                        SavedCubit()..init(popularPets[i].name),
                                    child: FavirIcon(
                                      image: popularPets[i].url,
                                      title: popularPets[i].name,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetsWidget extends StatelessWidget {
  const PetsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PetsInfoPage()));
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            child: Hero(
                              tag:
                                  "https://images.unsplash.com/photo-1581647521381-0c75dd5df603?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80pets1",
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images.unsplash.com/photo-1581647521381-0c75dd5df603?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                width: 150,
                                fit: BoxFit.cover,
                                height: 150,
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey,
                                  height: 140,
                                  width: 240,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text("What are the easiest pets to own?",
                                  style: title),
                              SizedBox(height: 15),
                              Text(
                                  "Fish, birds, and rodents are the easiest pets to own.",
                                  style: normalText)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    petsinfo.description,
                    style: normalText,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class HorizontalTypeSuggestion extends StatelessWidget {
  final String name;
  const HorizontalTypeSuggestion(
    this.name,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 80,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(.4),
        ),
        child: Text(name, style: title.copyWith(color: Colors.white)),
      ),
    );
  }
}
