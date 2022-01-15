import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/authenticaton/component/component.dart';
import 'package:social_app/screens/authenticaton/social_login/social_login_screen.dart';
import 'package:social_app/screens/authenticaton/social_register/social_register_cubit/cubit.dart';
import 'package:social_app/screens/authenticaton/social_register/social_register_cubit/states.dart';
import 'package:social_app/screens/layout/social_layout.dart';


class SocialRegisterBody extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
      listener: (context,state){
        if (state is SocialCreateUserSuccessState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SocialLayout()), (route) => false);
        }
      },
      builder: (context,state){
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,top: 50),
                child: Text('Register',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  fontSize: 40,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Username',
                        style: TextStyle(
                            fontFamily: 'Cairo',fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white
                        ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,top: 15),
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: buildTextField(
                            obscureText: false,
                            controller: nameController,
                            type: TextInputType.text,
                            hintText:'Input Your Username',

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontFamily: 'Cairo',fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white
                        ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,top: 15),
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: buildTextField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            hintText:'Input Your Password',
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Cairo',fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white
                        ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,top: 15),
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: buildTextField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hintText:'Input Your Email',
                            obscureText: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            fontFamily: 'Cairo',fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white
                        ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,top: 15),
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: buildTextField(
                              obscureText: false,
                              controller: phoneController,
                              type: TextInputType.phone,
                              hintText:'Input Your Phone'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            // CheckboxListTile(value: true, onChanged: (val){}),
                            Checkbox(value: false, onChanged: (val){}),
                            Text('I agree With Terms and Privacy',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomCenter ,
                      child: defaultButton(
                        text: 'Register',
                        height: 25,
                        width: 130,
                        // isUpperCase: false,
                        function: (){
                            SocialRegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                mobile: phoneController.text);
                        },
                        background: Colors.red,
                        radius: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Row(
                        children: [
                          Text('Already Have An Account?',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialLoginScreen()));

                          }, child: Text('Login',style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            fontSize: 20,
                          ),))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      // child: ,
    );
  }
}
