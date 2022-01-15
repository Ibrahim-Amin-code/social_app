import 'package:flutter/material.dart';

import 'social_login_body.dart';

class SocialLoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.grey,
      body: SocialLoginBoody(),
    );
  }
}
