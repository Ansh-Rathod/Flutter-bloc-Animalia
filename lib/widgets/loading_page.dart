import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:animalapp/themes/theme.dart';
import 'package:animalapp/widgets/cubit/saved_cubit.dart';

class LoadingPage extends StatelessWidget {
  final String image;
  final int index;
  final String title;
  const LoadingPage({
    Key? key,
    required this.image,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBarWithShadow(
            title: title,
            image: image,
            index: index,
          ),
        ]);
  }
}

class SliverAppBarWithShadow extends StatelessWidget {
  const SliverAppBarWithShadow({
    Key? key,
    this.isshow = false,
    required this.title,
    required this.image,
    required this.index,
  }) : super(key: key);
  final bool? isshow;
  final String title;
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      brightness: Brightness.dark,
      elevation: 0,
      actions: [
        if (isshow!)
          BlocProvider(
            create: (context) => SavedCubit()..init(title),
            child: FavirIcon(
              image: image,
              title: title,
            ),
          )
      ],
      backgroundColor: Colors.grey.shade900,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
        centerTitle: true,
        title: Text(title,
            textAlign: TextAlign.center,
            style: GoogleFonts.aclonica(
                textStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.center,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade900,
                Colors.transparent,
              ],
            ),
          ),
          child: Hero(
            tag: image + title + index.toString(),
            key: Key(image),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavirIcon extends StatelessWidget {
  final String title;
  final String image;

  const FavirIcon({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        return Container(
          child: IconButton(
              icon: Icon(
                Icons.favorite,
                color:
                    state.isSaved ? Colors.greenAccent.shade400 : Colors.white,
              ),
              onPressed: () {
                BlocProvider.of<SavedCubit>(context).like(title, image);
              }),
        );
      },
    );
  }
}
