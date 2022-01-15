import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/social_user_model.dart';
import 'package:social_app/network/cache/cache_helper.dart';
import 'package:social_app/network/const.dart';
import 'package:social_app/social_cubit/state.dart';

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  // SocialUserModel model = SocialUserModel();

  void getUserData()async
  {
    emit(SocialGetUserLoadingState());
    uId = await CacheHelper.getData(key: 'uId');
     // uId = await CacheHelper.getData(key: 'uId') ?? '';
    FirebaseFirestore.instance.collection('users').doc(uId).get().
    then((value) {
    emit(SocialGetUserSuccessState());
    }).catchError((error){
      emit(SocialGetUserErrorState(error.toString()));
      print(error.toString());
    });
  }


}