import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/application/firebase/firebase_bloc.dart';
import 'package:shopiee/core/constance.dart';
import 'package:shopiee/domain/firebase/model.dart';
import 'package:shopiee/presentation/login_setup/widgets/pick_image.dart';
import 'package:shopiee/presentation/login_setup/widgets/user_field.dart';
import 'package:shopiee/presentation/screens/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const signuprt = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final repeatController = TextEditingController();

    return BlocBuilder<FirebaseBloc, FirebaseState>(
      builder: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, HomeScreen.homert);
        } else if (state is Loading) {
          Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Register\nYour Account",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.spectral().fontFamily,
                        ),
                      ),
                      kHeight20,
                      Center(
                        child: ImagePick(),
                      ),
                      kHeight50,
                      UserInputField(
                        controller: usernameController,
                        hint: 'Username',
                        icon: CupertinoIcons.person_alt,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'username is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight,
                      UserInputField(
                        controller: emailController,
                        hint: 'Email',
                        icon: CupertinoIcons.mail_solid,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight,
                      UserInputField(
                        controller: phoneController,
                        hint: 'Phone Number',
                        icon: CupertinoIcons.phone_fill,
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'number is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight,
                      UserInputField(
                        controller: passwordController,
                        hint: 'Password',
                        obscureText: true,
                        icon: CupertinoIcons.lock_fill,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight,
                      UserInputField(
                        controller: repeatController,
                        hint: 'Repeat Password',
                        obscureText: true,
                        icon: CupertinoIcons.lock_fill,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter correct password';
                          } else if (value != passwordController.text) {
                            return 'password does not match';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight20,
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final user = UserModel(
                              name: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                            context.read<FirebaseBloc>().add(SignupEvent(user));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Your Accound has been registered 🍿',
                                    textAlign: TextAlign.center,
                                    style: textStyleSettings),
                                backgroundColor: Colors.grey,
                                behavior: SnackBarBehavior.floating,
                                padding: EdgeInsets.all(10),
                              ),
                            );

                            passwordController.clear();
                            emailController.clear();
                            phoneController.clear();
                            usernameController.clear();
                            repeatController.clear();
                          } else {}
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'SignUp',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Aldredy have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
