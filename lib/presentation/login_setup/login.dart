import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/application/firebase/firebase_bloc.dart';
import 'package:shopiee/core/constance.dart';
import 'package:shopiee/presentation/login_setup/signup.dart';
import 'package:shopiee/presentation/login_setup/widgets/user_field.dart';
import 'package:shopiee/presentation/screens/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const lloginrt = 'login';

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocListener<FirebaseBloc, FirebaseState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, HomeScreen.homert);
        } else if (state is Loading) {
          Center(child: CircularProgressIndicator());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight20,
                    Center(
                      child: SizedBox(
                        height: 90,
                        width: 240,
                        child: Image.asset(
                          'assets/shpiee_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    kHeight50,
                    Text(
                      "Let's Sign you in",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.spectral().fontFamily,
                      ),
                    ),
                    Text(
                      "Welcome back\nYou've been missed!",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey,
                        fontWeight: FontWeight.w100,
                        fontFamily: GoogleFonts.dellaRespira().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('  Enter your Email'),
                    kHeight5,
                    UserInputField(
                      controller: _emailController,
                      hint: 'Email',
                      icon: CupertinoIcons.person_alt,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kHeight20,
                    const Text('  Enter your password'),
                    kHeight5,
                    UserInputField(
                      controller: _passwordController,
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
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.signuprt);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    kHeight50,
                    InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<FirebaseBloc>().add(
                                LoginEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
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
                            'Login',
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                    kHeight,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
