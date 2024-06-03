import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopiee/application/firebase/firebase_bloc.dart';
import 'package:shopiee/presentation/login_setup/login.dart';
import 'package:shopiee/presentation/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FirebaseBloc>().add(CheckLoginStatus());
    return BlocListener<FirebaseBloc, FirebaseState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, HomeScreen.homert);
        } else if (state is UnAuthenticated) {
          Navigator.pushReplacementNamed(context, LoginScreen.lloginrt);
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(
              'assets/logoss.webp',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
