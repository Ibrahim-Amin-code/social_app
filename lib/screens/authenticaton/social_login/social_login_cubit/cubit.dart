import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/network/cache/cache_helper.dart';
import 'package:social_app/screens/authenticaton/social_login/social_login_cubit/states.dart';
// import 'package:social_app/screens/social_login_screen/social_login_cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
  required String email,
  required String password,
})
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
      .then((value){
        print(value.user!.email);
        print(value.user!.uid);
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(SocialLoginErrorState(error.toString()));
      print('error------------------------'+error.toString());
    });
  }

}