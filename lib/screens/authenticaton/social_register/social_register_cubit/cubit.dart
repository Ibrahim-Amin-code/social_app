import 'dart:ffi';

import'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/social_user_model.dart';
import 'package:social_app/network/cache/cache_helper.dart';
import 'package:social_app/screens/authenticaton/social_register/social_register_cubit/states.dart';
import 'package:social_app/screens/layout/social_layout.dart';



class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);



  void userRegister({
    context,
    required String email,
    required String password,
    required String name,
    required String mobile,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      // print('tooooooooooooooken-----------------------------------------------------------${value.credential.token}');
      print('emailllll-------------------------------------------------------------${value.user!.email}');
      print('uidddddd---------------------------------------------------------${value.user!.uid}');
      createUser(
        name: name,
        email: email,
        phone: mobile,
        uId: value.user!.uid,
      );
       CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      emit(SocialRegisterSuccessState());
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
      print('error-------------------------------------------------------------'+error.toString());
    });
  }


    void createUser({
      required String email,
      required String phone,
      required String name,
      required String uId,
    }){
    SocialUserModel socialUserModel =
        SocialUserModel(
            email: email,
            phone: phone,
            name: name,
            uId: uId,
            isEmailVerified: false,
        );

    FirebaseFirestore.instance
        .collection('users')
        .doc('uId')
        .set(socialUserModel.toMap()).then((value) {
          emit(SocialCreateUserSuccessState());
    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
      print('errorrrr---------------------------------------'+error.toString());
    });
  }
}