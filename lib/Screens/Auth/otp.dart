import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Auth/health_info.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:provider/provider.dart';

import '../../Providers/authProvider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otp = OtpFieldControllerV2();

  late AuthProvider authProvider;

  String? _enteredOTP;

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: OTPTextFieldV2(
                              controller: _otp,
                              length: 4,
                              autoFocus: true,
                              width: MediaQuery.of(context).size.width,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldWidth: 55,
                              fieldStyle: FieldStyle.box,
                              outlineBorderRadius: 15,
                              style: TextStyle(fontSize: 17),
                              onCompleted: (value){
                                setState(() {
                                  _enteredOTP=value;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'We have sent an OTP to the phone number you provided,',
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'If you have not received OTP, Check your phone number and try again',
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 270,
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
      if (_enteredOTP != null) {
        String otp = _enteredOTP.toString();
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
