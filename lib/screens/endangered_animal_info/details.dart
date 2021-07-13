import 'package:animalapp/screens/all_endangered_animals/all_endangerd_animals.dart';

import '../../models/endangered_animals.dart';
import 'bloc/endangered_animal_bloc.dart';
import '../types_info/types_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../models/animal_model.dart';
import '../../models/type_of_animals.dart';
import '../../models/types_info.dart';
import '../types_info/bloc/types_info_bloc.dart';
import '../../themes/theme.dart';
import '../../widgets/animals_list.dart';
import '../../widgets/error_page.dart';
import '../../widgets/loading_page.dart';

class EndangeredAnimalTypeInfoPage extends StatelessWidget {
  final EndangeredAnimalsType type;
  final int index;
  const EndangeredAnimalTypeInfoPage({
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
          body: BlocBuilder<EndangeredAnimalBloc, EndangeredAnimalState>(
            builder: (context, state) {
              if (state is EndangeredAnimalloaded) {
                return EndangeredAnimalTypeInfoWidget(
                  type: type,
                  index: index,
                  animals: state.animals,
                );
              } else if (state is EndangeredAnimalloading) {
                return LoadingPage(
                  image: type.image,
                  title: type.type,
                  index: index,
                );
              } else if (state is EndangeredAnimalError) {
                return ErrorPage();
              }
              return Container();
            },
          )),
    );
  }
}

class EndangeredAnimalTypeInfoWidget extends StatelessWidget {
  final EndangeredAnimalsType type;

  final int index;
  final List<Animals> animals;
  const EndangeredAnimalTypeInfoWidget({
    Key? key,
    required this.type,
    required this.index,
    required this.animals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBarWithShadow(
          title: type.type,
          image: type.image,
          index: index,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(type.intro, style: normalText),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...type.list
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
                  type.type,
                  style: heading.copyWith(color: Colors.greenAccent.shade400),
                ),
                trailing: IconButton(
                  tooltip: "See all",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllEndangeredAnimalsByBreed(
                                  index: index,
                                  image: type.image,
                                  name: type.type,
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
              height: 250,
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
