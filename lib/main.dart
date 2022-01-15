import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/network/cache/cache_helper.dart';
import 'package:social_app/screens/authenticaton/social_login/social_login_cubit/cubit.dart';
import 'package:social_app/screens/authenticaton/social_login/social_login_screen.dart';
import 'package:social_app/screens/authenticaton/social_register/social_register_cubit/cubit.dart';
import 'package:social_app/screens/layout/social_layout.dart';
import 'package:social_app/social_cubit/cubit.dart';

import 'network/bloc_observer.dart';
// import 'package:social_app/screens/login_scre/en/social_login_screen.dart'
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.inti();
  Bloc.observer = MyBlocObserver();

  Widget widget = SocialLoginScreen();

  final  String uId = await CacheHelper.getData(key: 'uId') ?? '';

  print('uId---------------------------------------'+uId.toString());
  if(uId != ''){
  widget = SocialLayout();
  }else{
    widget = widget;
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}
// login
// hello hema 12_7
// hello hema 12_7
class MyApp extends StatelessWidget {
  final Widget startWidget;
   MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocialLoginCubit>( create: (BuildContext context) => SocialLoginCubit()),
        BlocProvider<SocialRegisterCubit>( create: (BuildContext context) => SocialRegisterCubit()),
        BlocProvider<SocialCubit>( create: (BuildContext context) => SocialCubit()..getUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: startWidget),
      ),
    );
  }
}
