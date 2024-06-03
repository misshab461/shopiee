import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopiee/domain/firebase/model.dart';
import 'package:shopiee/domain/firebase/repo.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';
part 'firebase_bloc.freezed.dart';

@injectable
class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseFazard firebase;
  FirebaseBloc(this.firebase) : super(FirebaseState.initial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<CheckLoginStatus>((event, emit) async {
      log('Check login bloc called');
      User? user;
      try {
        await Future.delayed(const Duration(milliseconds: 2700), () {
          user = auth.currentUser;
        });

        if (user != null) {
          return emit(Authenticated(user));
        } else {
          return emit(const UnAuthenticated());
        }
      } catch (e) {
        return emit(HasError(message: e.toString()));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(const FirebaseState.loading());
      final userRegister = await firebase.signUpUser(event.user);

      try {
        if (userRegister != null) {
          return emit(Authenticated(userRegister));
        } else {
          return emit(const UnAuthenticated());
        }
      } catch (e) {
        return emit(HasError(message: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(const FirebaseState.loading());
      log('LOgin bloc called');

      try {
        final loggedUser = await firebase.logInUser(
            email: event.email, password: event.password);

        emit(Authenticated(loggedUser));
      } catch (e) {
        emit(HasError(message: e.toString()));
      }
    });

    on<SignoutEvent>((event, emit) async {
      emit(const Loading());
      await auth.signOut();
      emit(const UnAuthenticated());
    });
  }
}
