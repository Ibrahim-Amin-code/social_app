import 'package:flutter/material.dart';
import 'package:social_app/screens/authenticaton/social_register/social_register_body.dart';


class SocialRegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.grey,
      body: SocialRegisterBody(),
    );
  }
}
