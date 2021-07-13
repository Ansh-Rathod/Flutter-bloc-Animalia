import '../models/type_of_animals.dart';
import '../screens/animal_info/animal_info.dart';
import '../screens/animal_info/bloc/animals_info_bloc.dart';
import '../themes/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarousel extends StatelessWidget {
  moveToInfo(BuildContext context, String name, String url, int i) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      AnimalsInfoBloc()..add(LoadAnimalInfo(name: name)),
                  child: AnimalsInfoPage(
                    image: url,
                    index: i,
                    title: name,
                  ),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
      ),
      items: [
        for (var i = 0; i < popularAnimals.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                moveToInfo(
                    context, popularAnimals[i].name, popularAnimals[i].url, i);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Hero(
                        tag: popularAnimals[i].url +
                            popularAnimals[i].name +
                            i.toString(),
                        child: CachedNetworkImage(
                            width: double.infinity,
                            imageUrl: popularAnimals[i].url,
                            height: 120,
                            errorWidget: (context, url, error) => Container(
                                  color: Colors.grey,
                                  height: 120,
                                  width: double.infinity,
                                ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        popularAnimals[i].name,
                        style: title.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        popularAnimals[i].tagline,
                        style: normalText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
