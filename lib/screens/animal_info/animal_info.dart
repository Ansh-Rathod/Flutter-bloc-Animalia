import 'dart:math';

import 'package:animalapp/models/class_model.dart';
import 'package:animalapp/screens/classs_info/class_animals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:readmore/readmore.dart';

import '../../models/animal_info_model.dart';
import '../../models/animal_model.dart';
import '../../models/types_info.dart';
import 'bloc/animals_info_bloc.dart';
import '../types_info/types_info.dart';
import '../../themes/theme.dart';
import '../../widgets/animals_list.dart';
import '../../widgets/error_page.dart';
import '../../widgets/expandable_group.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_page.dart';

class AnimalsInfoPage extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  const AnimalsInfoPage({
    Key? key,
    required this.image,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: BlocBuilder<AnimalsInfoBloc, AnimalsInfoState>(
          builder: (context, state) {
            if (state is AnimalsInfoloaded) {
              return AnimalInfoWidget(
                info: state.info,
                animals: state.animals,
                doc: state.info.doc,
                image: image,
                name: title,
                index: index,
              );
            } else if (state is AnimalsInfoloading) {
              return LoadingPage(
                image: image,
                title: title,
                index: index,
              );
            } else if (state is AnimalsInfoError) {
              return ErrorPage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class AnimalInfoWidget extends StatelessWidget {
  final AnimalInfo info;
  final String name;
  final int index;
  final String image;
  final List<Animals> animals;
  final DocumentSnapshot<Map<String, dynamic>> doc;
  const AnimalInfoWidget({
    Key? key,
    required this.info,
    required this.name,
    required this.index,
    required this.image,
    required this.animals,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBarWithShadow(
          title: name,
          image: image,
          isshow: true,
          index: index,
        ),
        if (info.information.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReadMoreText(
                info.information[0].value,
                trimLines: 5,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                style:
                    normalText.copyWith(fontSize: 16, color: Colors.grey[300]),
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:
                    normalText.copyWith(color: Colors.greenAccent.shade400),
              ),
            ),
          ),
        if (info.feilds.contains('Slogan'))
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Fun Fact about " +
                    info.name +
                    " " +
                    info.doc.data()!['slogan'],
                style:
                    normalText.copyWith(fontSize: 18, color: Colors.grey[300]),
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (info.feilds.contains('Class'))
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            "Class: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Text(
                            info.doc.data()!['class'],
                            style: normalText.copyWith(
                                fontSize: 18, color: Colors.grey[300]),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Class')) SizedBox(height: 10),
                  if (info.feilds.contains('Scientific Name'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scientific Name: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['scientificname'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Scientific Name'))
                    SizedBox(height: 10),
                  if (info.feilds.contains('Common Name'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Common Name: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['commonname'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Common Name')) SizedBox(height: 10),
                  if (info.feilds.contains('Group'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Group: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['group'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Group')) SizedBox(height: 10),
                  if (info.feilds.contains('Lifespan'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Average Life Span: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['lifespan'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Lifespan')) SizedBox(height: 10),
                  if (info.feilds.contains('Diet'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diet: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['diet'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Diet')) SizedBox(height: 10),
                  if (info.feilds.contains('Weight'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['weight'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Weight')) SizedBox(height: 10),
                  if (info.feilds.contains('Location'))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location: ",
                            style: title.copyWith(fontSize: 18),
                          ),
                          Container(
                            child: Text(
                              info.doc.data()!['location'],
                              style: normalText.copyWith(
                                  fontSize: 16, color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (info.feilds.contains('Location')) SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        if (info.images.isNotEmpty)
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              info.name + " Images",
              style: heading,
            ),
          )),
        if (info.images.isNotEmpty)
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              child: ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  for (int i = 0; i < info.images.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: ViewPhotos(
                              imageIndex: i,
                              imageList: info.images,
                            ),
                            pageTransitionAnimation:
                                PageTransitionAnimation.slideUp,
                            withNavBar: false,
                          );
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    info.images[i]['image'],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                ],
              ),
            ),
          ),
        if (info.information.isNotEmpty)
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              info.name + " articals",
              style: heading,
            ),
          )),
        if (info.information.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < info.information.length; i++)
                        if (info.information[i].key !=
                            info.information[i].value)
                          if (info.information[i].value !=
                              "See all of our expert product reviews.")
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 200,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: SingleChildScrollView(
                                    child: ReadMoreText(
                                      info.information[i].value,
                                      trimLines: 8,
                                      colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      style: normalText.copyWith(
                                          fontSize: 16,
                                          color: Colors.grey[300]),
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: 'Show less',
                                      moreStyle: normalText.copyWith(
                                          color: Colors.greenAccent.shade400),
                                    ),
                                  )),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (info.feilds.contains('Class'))
          if (animals.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Similar Animals from",
                          style: heading.copyWith(color: Colors.white),
                        ),
                        Text(
                          "\"${info.doc.data()!['class']}\"",
                          style: heading.copyWith(
                              color: Colors.greenAccent.shade400),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      tooltip: "See all",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassTypeInfoPage(
                                      index: index,
                                      type: ClassModel(
                                          name: info.doc.data()!['class'],
                                          image: image),
                                    )));
                      },
                      icon: Icon(Icons.arrow_forward,
                          color: Colors.greenAccent.shade400),
                    ),
                  )),
            ),
        if (info.feilds.contains('Class'))
          if (animals.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    children: [
                      for (int i = 0; i < animals.length; i++)
                        AnimalsCard(
                          animals: animals[i],
                          index: i,
                        )
                    ],
                  ),
                ),
              ),
            ),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
