import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ViewPhotos extends StatefulWidget {
  final String heroTitle;
  final imageIndex;
  final List<dynamic> imageList;
  ViewPhotos(
      {this.imageIndex, required this.imageList, this.heroTitle = "img"});
  @override
  _ViewPhotosState createState() => _ViewPhotosState();
}

class _ViewPhotosState extends State<ViewPhotos> {
  late PageController pageController;
  late int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.imageIndex;
    pageController = PageController(initialPage: widget.imageIndex);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        pageController: pageController,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage("${widget.imageList[index]['image']}"),
            minScale: PhotoViewComputedScale.contained,
            heroAttributes:
                PhotoViewHeroAttributes(tag: "photo${widget.imageIndex}"),
          );
        },
        onPageChanged: onPageChanged,
        itemCount: widget.imageList.length,
        loadingBuilder: (context, progress) => Center(
          child: Container(
            child: CircularProgressIndicator(
              color: Colors.greenAccent.shade400,
              backgroundColor: Colors.grey.shade900,
              value: progress == null
                  ? null
                  : progress.cumulativeBytesLoaded /
                      progress.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );
  }
}
