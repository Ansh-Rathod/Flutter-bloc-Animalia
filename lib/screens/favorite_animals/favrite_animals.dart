import 'package:animalapp/screens/animal_info/animal_info.dart';
import 'package:animalapp/screens/animal_info/bloc/animals_info_bloc.dart';
import 'package:animalapp/screens/favorite_animals/bloc/favorite_bloc.dart';
import 'package:animalapp/themes/theme.dart';
import 'package:animalapp/widgets/animals_list.dart';
import 'package:animalapp/widgets/cubit/saved_cubit.dart';
import 'package:animalapp/widgets/favorite_card.dart';
import 'package:animalapp/widgets/loading_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAnimals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        // appBar: AppBar(
        //   title: Text("Favorite Animals"),
        //   brightness: Brightness.dark,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoaded) {
              return Container(
                  child: StreamBuilder(
                      builder: (context, AsyncSnapshot snp) {
                        if (!snp.hasData) {
                          return CustomScrollView(
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              slivers: [
                                SliverAppBarWithShadow(
                                  isshow: false,
                                  title: "Favorite Animals",
                                  image:
                                      "https://source.unsplash.com/1600x900/?wild,animals",
                                  index: 0,
                                ),
                              ]);
                        } else if (snp.hasData) {
                          return CustomScrollView(
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              slivers: [
                                SliverAppBarWithShadow(
                                  isshow: false,
                                  title: "Favorite Animals",
                                  image:
                                      "https://source.unsplash.com/1600x900/?wild,animals",
                                  index: 0,
                                ),
                                if (snp.data.docs.isNotEmpty)
                                  SliverToBoxAdapter(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 0),
                                      child: GridView(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 10 / 16),
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          for (var i = 0;
                                              i < snp.data.docs.length;
                                              i++)
                                            FavoriteAnimalsGridCard(
                                              name: snp.data.docs[i]['name'],
                                              index: i,
                                              classname: '',
                                              image: snp.data.docs[i]['image'],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                else
                                  SliverToBoxAdapter(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .5,
                                      child: Center(
                                        child: Text(
                                            "Not Any Favorite Animals added yet!",
                                            style: normalText),
                                      ),
                                    ),
                                  )
                              ]);
                        } else {
                          return Container();
                        }
                      },
                      stream: state.stream));
            } else if (state is FavoriteLoading) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
