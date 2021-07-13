import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animalapp/screens/animal_info/animal_info.dart';
import 'package:animalapp/screens/animal_info/bloc/animals_info_bloc.dart';
import 'package:animalapp/themes/theme.dart';
import 'package:animalapp/widgets/loading_page.dart';

import 'cubit/saved_cubit.dart';

class FavoriteAnimalsGridCard extends StatelessWidget {
  final String name;
  final String image;
  final int index;
  final String classname;
  const FavoriteAnimalsGridCard({
    Key? key,
    required this.name,
    required this.image,
    required this.index,
    required this.classname,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      AnimalsInfoBloc()..add(LoadAnimalInfo(name: name)),
                  child: AnimalsInfoPage(
                    image: image,
                    title: name,
                    index: index,
                  ),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          moveToInfo(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Hero(
                        tag: image + name + index.toString(),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          height: MediaQuery.of(context).size.width * .5,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey,
                            height: MediaQuery.of(context).size.width * .5,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: title.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: Text(
                        classname,
                        style: normalText,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: BlocProvider(
                  create: (context) => SavedCubit()..init(name),
                  child: FavirIcon(
                    image: image,
                    title: name,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
