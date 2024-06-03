import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/core/constance.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;
  final String title;
  final String imageUrl;
  final String description;
  final String price;
  final String category;
  final String rating;

  const DetailsScreen({
    super.key,
    required this.movieId,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
  });
  static const detailrt = 'rt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.chevron_compact_left,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.bookmark,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              kHeight5,
              Center(
                child: Container(
                  height: 320,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 20,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.stylish().fontFamily,
                ),
              ),
              kHeight,
              Text(
                'Category : $category',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.stylish().fontFamily,
                ),
              ),
              Text(
                'price : $price',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.stylish().fontFamily,
                ),
              ),
              kHeight50,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    const Center(
                      child: Icon(
                        CupertinoIcons.chevron_compact_down,
                        size: 30,
                      ),
                    ),
                    kHeight,
                    Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontFamily:
                            GoogleFonts.vigaTextTheme().bodyMedium!.fontFamily,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        downloadBar(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: const Text(
                            'BUY',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column bottomDetails({
    required String title,
    required String orgdata,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 15,
            fontFamily: GoogleFonts.vigaTextTheme().bodyMedium!.fontFamily,
          ),
        ),
        kHeight5,
        Text(
          orgdata,
          style: TextStyle(
            fontFamily: GoogleFonts.vigaTextTheme().bodyMedium!.fontFamily,
          ),
        ),
      ],
    );
  }

  Future<void> downloadBar(context) async {
    Timer? _timer;
    showCupertinoModalPopup(
      semanticsDismissible: true,
      context: context,
      builder: (context) {
        _timer = Timer(
          const Duration(seconds: 2),
          () => Navigator.pop(context),
        );
        return Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
        );
      },
    ).then((value) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }
}
