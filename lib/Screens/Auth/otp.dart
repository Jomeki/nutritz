import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Auth/health_goal.dart';
import 'package:nutriapp/Screens/Auth/health_info.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
          children: [
            SizedBox(height: 160.0,),
            Text('OTP Verification', style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.w700,fontFamily: 'Inter')),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: SizedBox(
                        width: 70.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.loginBorderColor,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: SizedBox(
                        width: 70.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.loginBorderColor,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: SizedBox(
                        width: 70.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.loginBorderColor,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: SizedBox(
                        width: 70.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.loginBorderColor,
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
                    ),
                  ],),
                  Text('We have sent an OTP to the phone number you provided,'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('If you have not received OTP'),
                      Text(' Resend in 3s',style: TextStyle(color: AppColors.primaryColor),)
                    ],
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthInfoScreen(),));
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
