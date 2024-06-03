import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopiee/application/firebase/firebase_bloc.dart';
import 'package:shopiee/application/product/product_bloc.dart';
import 'package:shopiee/core/theme.dart';
import 'package:shopiee/domain/core/di/di.dart';
import 'package:shopiee/firebase_options.dart';
import 'package:shopiee/presentation/login_setup/login.dart';
import 'package:shopiee/presentation/login_setup/signup.dart';
import 'package:shopiee/presentation/login_setup/splash.dart';
import 'package:shopiee/presentation/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjectable();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductBloc>()),
        BlocProvider(create: (context) => getIt<FirebaseBloc>()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.lloginrt: (context) => LoginScreen(),
          SignUpScreen.signuprt: (context) => SignUpScreen(),
          HomeScreen.homert: (context) => HomeScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
