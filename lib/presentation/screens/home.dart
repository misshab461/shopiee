import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/application/firebase/firebase_bloc.dart';
import 'package:shopiee/application/product/product_bloc.dart';
import 'package:shopiee/core/constance.dart';
import 'package:shopiee/presentation/login_setup/login.dart';
import 'package:shopiee/presentation/screens/detail.dart';
import 'package:shopiee/presentation/screens/widget/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const homert = 'home';

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductEvent.getAllProduct());
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopiee'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {
                context.read<FirebaseBloc>().add(SignoutEvent());
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.lloginrt, (route) => false);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight20,
            Text(
              'ALL PRODUCT',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.spectral().fontFamily,
              ),
            ),
            kHeight20,
            SizedBox(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: .8,
                        color: Colors.grey,
                      ),
                    );
                  }

                  return CustomCarouselSlider(
                    itemCount: state.getAllProduct.length,
                    height: 400,
                    portFraction: .9,
                    itemBuilder: (context, index, realIndex) {
                      final data = state.getAllProduct[index];
                      return ImageContainer(
                        width: 300,
                        imageUrl: '${data.image}',
                        onContainerTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(
                                movieId: data.id!,
                                title: data.title ?? 'null',
                                imageUrl: data.image ?? 'null',
                                description: data.description ?? 'null',
                                price: data.price.toString(),
                                category: data.category ?? 'null',
                                rating: data.rating.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'TAP TO SHOW DETAILS 👆',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.spectral().fontFamily,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logoss.webp',
                      width: 150,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
