import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/type_of_animals.dart';
import '../screens/types_info/bloc/types_info_bloc.dart';
import '../screens/types_info/types_info.dart';
import '../themes/theme.dart';

class TypeofAnimals extends StatelessWidget {
  final AnimalsType type;
  final int index;
  const TypeofAnimals({
    Key? key,
    required this.type,
    required this.index,
  }) : super(key: key);
  moveToInfo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      TypesInfoBloc()..add(LoadTypeInfo(name: type.title)),
                  child: TypeInfoPage(
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
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: type.image + type.title + index.toString(),
                  child: Container(
                    width: 180,
                    height: 100,
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
                    type.title,
                    textAlign: TextAlign.left,
                    style: title.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Text(
                    type.description,
                    maxLines: 4,
                    style: normalText,
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
