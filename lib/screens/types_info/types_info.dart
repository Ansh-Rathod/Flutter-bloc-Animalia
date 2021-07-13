import 'package:animalapp/screens/all_type_animals/all_type.animals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../models/animal_model.dart';
import '../../models/type_of_animals.dart';
import '../../models/types_info.dart';
import 'bloc/types_info_bloc.dart';
import '../../themes/theme.dart';
import '../../widgets/animals_list.dart';
import '../../widgets/error_page.dart';
import '../../widgets/loading_page.dart';

class TypeInfoPage extends StatelessWidget {
  final AnimalsType type;
  final int index;
  const TypeInfoPage({
    Key? key,
    required this.type,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: scaffoldColor,
          body: BlocBuilder<TypesInfoBloc, TypesInfoState>(
            builder: (context, state) {
              if (state is TypesInfoloaded) {
                return TypeInfoWidget(
                  info: state.info,
                  type: type,
                  index: index,
                  animals: state.animals,
                );
              } else if (state is TypesInfoloading) {
                return LoadingPage(
                  image: type.image,
                  title: type.title,
                  index: index,
                );
              } else if (state is TypesInfoError) {
                return ErrorPage();
              }
              return Container();
            },
          )),
    );
  }
}

class TypeInfoWidget extends StatelessWidget {
  final AnimalsType type;

  final Typeinfo info;
  final int index;
  final List<Animals> animals;
  const TypeInfoWidget({
    Key? key,
    required this.type,
    required this.info,
    required this.index,
    required this.animals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBarWithShadow(
          title: type.title,
          image: type.image,
          index: index,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(info.intro, style: normalText),
          ),
        ),
        if (info.characteristics.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Text(
                "Characteristics of " + type.title,
                style: heading.copyWith(color: Colors.greenAccent.shade400),
              ),
            ),
          ),
        if (info.characteristics.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...info.characteristics
                      .map((chara) => ExpansionPanelListWidget(
                            info: chara,
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Text(
              info.info1,
              style: heading.copyWith(color: Colors.greenAccent.shade400),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ReadMoreText(
              "     " + info.info1about.replaceAll("\\n", "\n       "),
              trimLines: 10,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              style: normalText,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle:
                  normalText.copyWith(color: Colors.greenAccent.shade400),
            ),
          ),
        ),
        if (info.info2about.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Text(
                info.info2,
                style: heading.copyWith(color: Colors.greenAccent.shade400),
              ),
            ),
          ),
        if (info.info2about.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...info.info2about
                      .map((chara) => ExpansionPanelListWidget(
                            info: chara,
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  type.title,
                  style: heading.copyWith(color: Colors.greenAccent.shade400),
                ),
                trailing: IconButton(
                  tooltip: "See all",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllAnimalsByType(
                                  index: index,
                                  image: type.image,
                                  name: type.title,
                                )));
                  },
                  icon: Icon(Icons.arrow_forward,
                      color: Colors.greenAccent.shade400),
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 245,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                children: [
                  for (var i = 0; i < animals.length; i++)
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
          child: SizedBox(height: 30),
        )
      ],
    );
  }
}

class ExpansionPanelListWidget extends StatelessWidget {
  final KeyValueData info;
  const ExpansionPanelListWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(.4),
        ),
        child: ExpandablePanel(
          header: Text(
            info.key,
            style: title.copyWith(color: Colors.grey[50]),
          ),
          collapsed: Text(
            info.value,
            softWrap: true,
            maxLines: 2,
            style: normalText.copyWith(color: Colors.grey[300]),
            overflow: TextOverflow.ellipsis,
          ),
          expanded: Text(
            info.value,
            softWrap: true,
            style: normalText.copyWith(color: Colors.grey[100]),
          ),
          theme: ExpandableThemeData(
            iconColor: Colors.greenAccent.shade400,
          ),
        ),
      ),
    );
  }
}
