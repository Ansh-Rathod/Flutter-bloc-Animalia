import 'package:animalapp/models/animal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:animalapp/models/class_model.dart';
import 'package:animalapp/screens/animal_info/animal_info.dart';
import 'package:animalapp/screens/animal_info/bloc/animals_info_bloc.dart';
import 'package:animalapp/screens/classs_info/class_animals.dart';
import 'package:animalapp/screens/home/home.dart';
import 'package:animalapp/screens/search_page/cubit/search_cubit.dart';
import 'package:animalapp/themes/theme.dart';

class SearchPage extends StatelessWidget {
  List animalssearch = [
    "Bernese Mountain Dog",
    "Bernese Shepherd",
    "Bichir",
    "Bichon Frise",
    "Bichpoo",
    "Biewer Terrier",
    "Bighorn Sheep",
    "Bilby",
    "Binturong",
    "Chimpanzee",
    "Chinchilla",
    "Chinese Crested Dog",
    "Chinese Paddlefish",
    "Chinese Shar-Pei",
  ]..shuffle();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: scaffoldColor,
            body: Stack(
              fit: StackFit.expand,
              children: [
                SafeArea(
                  child: Container(
                    color: scaffoldColor,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 70),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20),
                            child: Text(
                              "Popular Animals",
                              style: heading.copyWith(
                                color: Colors.greenAccent.shade400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              ...animalSearchName
                                  .map((word) =>
                                      ChipWidget(word.name, word.image))
                                  .toList()
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20),
                            child: Text(
                              "Animals by class",
                              style: heading.copyWith(
                                color: Colors.greenAccent.shade400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          for (var i = 0; i < classList.length; i++)
                            ClassList(
                              model: classList[i],
                              index: i,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                FloatingSearchBar(
                  hint: 'Search...',
                  hintStyle: normalText,
                  queryStyle: normalText,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.grey.shade700,
                  scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                  transitionDuration: const Duration(milliseconds: 800),
                  transitionCurve: Curves.easeInOut,
                  physics: const BouncingScrollPhysics(),
                  axisAlignment: 0.0,
                  accentColor: Colors.white,
                  openAxisAlignment: 0.0,
                  iconColor: Colors.white,
                  width: 600,
                  debounceDelay: const Duration(milliseconds: 500),
                  onQueryChanged: (query) {
                    BlocProvider.of<SearchCubit>(context).onChangeText(query);
                  },
                  transition: CircularFloatingSearchBarTransition(),
                  actions: [
                    FloatingSearchBarAction(
                      showIfOpened: false,
                      child: CircularButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                    FloatingSearchBarAction.searchToClear(
                      showIfClosed: false,
                    ),
                  ],
                  builder: (context, transition) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        color: Colors.grey.shade900,
                        elevation: 0.0,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('searchArray')
                              .where('searchArray',
                                  arrayContains: state.query.toLowerCase())
                              .limit(20)
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot snp) {
                            if (!snp.hasData) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (snp.hasData) {
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: snp.data!.docs
                                      .map<Widget>((dat) => Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  moveToInfo(
                                                      context,
                                                      dat['name'],
                                                      dat['image'] ??
                                                          "https://images.pexels.com/photos/4439425/pexels-photo-4439425.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                                                      2);
                                                },
                                                leading: Container(
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade900,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        dat['image'] ??
                                                            "https://images.pexels.com/photos/4439425/pexels-photo-4439425.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  dat['name'] ?? "",
                                                  style: normalText,
                                                ),
                                                subtitle: Text(
                                                  dat['class'] ?? "",
                                                  style: normalText,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList());
                            } else if (!snp.hasError) {
                              return Text(
                                "error",
                                style: TextStyle(color: Colors.black),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  moveToInfo(BuildContext context, String name, String url, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      AnimalsInfoBloc()..add(LoadAnimalInfo(name: name)),
                  child: AnimalsInfoPage(
                    image: url,
                    title: name,
                    index: index,
                  ),
                )));
  }
}

class ClassList extends StatelessWidget {
  final ClassModel model;
  final int index;
  const ClassList({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClassTypeInfoPage(
                          index: index,
                          type: model,
                        )));
          },
          child: Container(
            color: Colors.black.withOpacity(.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 80,
                  color: Colors.grey,
                  child: Hero(
                    tag: model.image + model.name + index.toString(),
                    child: CachedNetworkImage(
                      imageUrl: model.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey,
                        height: 80,
                        width: 120,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            model.name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: title.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String text;
  final String image;
  const ChipWidget(
    this.text,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) =>
                    AnimalsInfoBloc()..add(LoadAnimalInfo(name: text)),
                child: AnimalsInfoPage(
                  image: image,
                  title: text,
                  index: 0,
                ),
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(.5),
          ),
          child: Text(text,
              style: title.copyWith(color: Colors.white.withOpacity(.9))),
        ),
      ),
    );
  }
}
