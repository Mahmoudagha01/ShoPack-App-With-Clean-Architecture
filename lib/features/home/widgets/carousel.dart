import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


import '../../../core/colors/colors.dart';
import '../../../core/utilities/mediaquery.dart';

class Carousel extends StatefulWidget {
  final List images;
  const Carousel({super.key, required this.images});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int current = 0;
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: current);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: kHeight(context) * 0.3,
            child: PhotoViewGallery.builder(
              backgroundDecoration:
                  const BoxDecoration(color: ColorManager.white),
              itemCount: widget.images.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.images[index].url),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 1.8,
                );
              },
              enableRotation: true,
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: pageController,
              loadingBuilder: (context, event) {
                return const Center(child: CircularProgressIndicator());
              },
              onPageChanged: (int index) {
                setState(() {
                  current = index;
                });
              },
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            color: ColorManager.white,
            child: CarouselSlider.builder(
              itemCount: widget.images.length,
              options: CarouselOptions(
                initialPage: current,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
                enlargeCenterPage: true,
                autoPlay: false,
      
                viewportFraction: 0.27,
                height: 100,
              ),
              itemBuilder: (context, index, i) => Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                    pageController!.jumpToPage(current);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                           
                    ),
                      child: Image.network(
                    widget.images[index].url!,
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
