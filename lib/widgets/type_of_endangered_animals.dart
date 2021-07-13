import '../models/endangered_animals.dart';
import '../screens/endangered_animal_info/bloc/endangered_animal_bloc.dart';
import '../screens/endangered_animal_info/details.dart';
import '../themes/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndangeredAnimalTypeWidget extends StatelessWidget {
  final EndangeredAnimalsType type;
  final int index;
  const EndangeredAnimalTypeWidget({
    Key? key,
    required this.type,
    required this.index,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EndangeredAnimalBloc()
                    ..add(LoadAnimalInfo(name: type.type)),
                  child: EndangeredAnimalTypeInfoPage(
                    type: type,
                    index: index,
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
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: type.image + type.type + index.toString(),
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(type.image),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    type.type,
                    textAlign: TextAlign.left,
                    style: title.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                //   child: Text(
                //     type.intro,
                //     maxLines: 3,
                //     overflow: TextOverflow.ellipsis,
                //     style: normalText,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
