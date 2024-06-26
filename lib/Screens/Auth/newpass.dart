import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Auth/login.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Services/validator.dart';
import 'package:nutriapp/Themes/colors.dart';

import '../../Resources/assets.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passConroller = TextEditingController();
  TextEditingController coonfirmpassConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Nutritz',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 36,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .1,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("New Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: TextFormField(
                      controller: passConroller,
                      validator: (pass)=>pass!=null?InputValidators.passValidator(pass):null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'New Passsword',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(
                          CupertinoIcons.padlock_solid,
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: TextFormField(
                      controller: coonfirmpassConroller,
                      validator: (conpass)=>conpass!=null?InputValidators.passValidator(conpass):null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Passsword',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(
                          CupertinoIcons.padlock_solid,
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.loginBorderColor)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.screenHeight * .3,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                                color: Colors.white),
                                            width: 250,
                                            height: 280,
                                            child: Padding(
                                              padding: const EdgeInsets.all(24.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AssetsLoader.success,
                                                    width: 120,
                                                    height: 120,
                                                    scale: 2,
                                                  ),
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w900,color: Colors.black),
                                                    child: Text('Password \nChanged \nSuccessfully'),textAlign: TextAlign.center,),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              });
                          Future.delayed(Duration(seconds: 2), () async {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()), (route) => false
                            );
                          });
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
