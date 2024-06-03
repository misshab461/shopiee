import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  final Widget Function(BuildContext context, int index, int realIndex)
      itemBuilder;
  final int itemCount;
  final double portFraction;
  final double height;

  const CustomCarouselSlider({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.portFraction = 0.55,
    this.height = 230,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: height,
        viewportFraction: portFraction,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imageUrl,
    required this.onContainerTap,
    this.width = 170,
  });

  final String imageUrl;
  final void Function() onContainerTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onContainerTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(8, 0),
              blurRadius: 20,
              spreadRadius: -18,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
