import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/social_cubit/cubit.dart';
import 'package:social_app/social_cubit/state.dart';

class SocialLayout extends StatelessWidget {
  // const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
          ),
          body: Center(
            child: Container(
              child: Text('Layout'),
            ),
          ),
        );
      },
      // child:,
    );
  }
}
