import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/pet_info.dart';
import '../screens/breed_info_page/bloc/get_pets_bloc.dart';
import '../screens/breed_info_page/pet_details.dart';
import '../themes/theme.dart';

class HorizontalList extends StatelessWidget {
  final int index;
  final AsPet pet;
  final PetbyBreed type;
  const HorizontalList({
    Key? key,
    required this.index,
    required this.pet,
    required this.type,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      GetPetsBloc()..add(LoadAnimalInfo(name: type.title)),
                  child: PetDetails(
                    index: index,
                    type: type,
                    pet: pet,
                  ),
                )));
  }

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
            moveToInfo(context);
          },
          child: Container(
            color: Colors.black.withOpacity(.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Hero(
                      tag: type.image + type.title + index.toString(),
                      child: CachedNetworkImage(
                        imageUrl: type.image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          type.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: title.copyWith(
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Text(
                          type.description,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: normalText,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
