import 'package:animalapp/widgets/cubit/saved_cubit.dart';
import 'package:animalapp/widgets/loading_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/animal_model.dart';
import '../screens/animal_info/animal_info.dart';
import '../screens/animal_info/bloc/animals_info_bloc.dart';
import '../themes/theme.dart';

class AnimalsCard extends StatelessWidget {
  final Animals animals;
  final int index;

  const AnimalsCard({
    Key? key,
    required this.animals,
    required this.index,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AnimalsInfoBloc()
                    ..add(LoadAnimalInfo(name: animals.name)),
                  child: AnimalsInfoPage(
                    image: animals.url,
                    title: animals.name,
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
                height: double.infinity,
                color: Colors.black.withOpacity(.3),
                width: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: animals.url + animals.name + index.toString(),
                      child: CachedNetworkImage(
                        imageUrl: animals.url,
                        height: 140,
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                          height: 140,
                          width: 240,
                        ),
                        width: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        animals.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: title.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        animals.slogan,
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
                    create: (context) => SavedCubit()..init(animals.name),
                    child: FavirIcon(
                      image: animals.url,
                      title: animals.name,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalsGridCard extends StatelessWidget {
  final Animals animals;
  final int index;

  const AnimalsGridCard({
    Key? key,
    required this.animals,
    required this.index,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AnimalsInfoBloc()
                    ..add(LoadAnimalInfo(name: animals.name)),
                  child: AnimalsInfoPage(
                    image: animals.url,
                    title: animals.name,
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
                        tag: animals.url + animals.name + index.toString(),
                        child: CachedNetworkImage(
                          imageUrl: animals.url,
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
                        animals.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: title.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        animals.slogan,
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
                    create: (context) => SavedCubit()..init(animals.name),
                    child: FavirIcon(
                      image: animals.url,
                      title: animals.name,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
