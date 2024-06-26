import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Auth/health_info.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Providers/authProvider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _one = TextEditingController();
  final _two = TextEditingController();
  final _three = TextEditingController();
  final _four = TextEditingController();

  late AuthProvider authProvider;

  @override
  void didChangeDependencies() {
    authProvider = Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }

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
          children: [
            SizedBox(
              height: 160.0,
            ),
            Text('OTP Verification',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: TextFormField(
                              controller: _one,
                              strutStyle: StrutStyle(
                                height: 2.5,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.loginBorderColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: TextFormField(
                              controller: _two,
                              strutStyle: StrutStyle(
                                height: 2.5,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.loginBorderColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: TextFormField(
                              controller: _three,
                              strutStyle: StrutStyle(
                                height: 2.5,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.loginBorderColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: TextFormField(
                              controller: _four,
                              strutStyle: StrutStyle(
                                height: 2.5,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.loginBorderColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.loginBorderColor)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'We have sent an OTP to the phone number you provided,',
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('If you have not received OTP'),
                        Text(
                          ' Resend in 3s',
                          style: TextStyle(color: AppColors.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 300,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * .5,
                      height: 50,
                      child: FilledButton(
                        onPressed: _saveRegistrationData,
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
            ),
          ],
        ),
      ),
    );
  }

  Future _saveRegistrationData() async {
    if (_formKey.currentState!.validate()) {
      if (_one.text.isNotEmpty &&
          _two.text.isNotEmpty &&
          _three.text.isNotEmpty &&
          _four.text.isNotEmpty) {
        String otp =
            "${_one.text.toString()}${_two.text.toString()}${_three.text.toString()}${_four.text.toString()}";
        if (authProvider.otp.toString() == otp) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HealthInfoScreen()));
        }
      }
    }
  }
}
