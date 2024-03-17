import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Main/evaluation_three.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

import '../home.dart';

class EvaluationQuestionFour extends StatefulWidget {
  const EvaluationQuestionFour({super.key});

  @override
  State<EvaluationQuestionFour> createState() => _EvaluationQuestionFourState();
}

class _EvaluationQuestionFourState extends State<EvaluationQuestionFour> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
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

            SizedBox(
              height: 80.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO Allow user to select one option only for this screen
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                    child: Text('What is your activity level?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: CheckboxListTile(
                        value: isChanged,
                        onChanged: (bool? newval) {
                          setState(() {
                            isChanged = newval!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("Not active"),
                        subtitle: Text('Spends most of the day sitting (e.g Desk job)',style: TextStyle(fontSize: 12.0),),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: CheckboxListTile(
                        value: isChanged,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onChanged: (bool? newval) {
                          setState(() {
                            isChanged = newval!;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("Lightly Active"),
                        subtitle: Text('Spends most of the day on your feet (e.g Teacher)',style: TextStyle(fontSize: 12.0),),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: CheckboxListTile(
                        value: isChanged,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onChanged: (bool? newval) {
                          setState(() {
                            isChanged = newval!;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("Active"),
                        subtitle: Text("Spends most of the day doing physical activity (e.g  Postal carrier)",style: TextStyle(fontSize: 12.0),),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: CheckboxListTile(
                        value: isChanged,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onChanged: (bool? newval) {
                          setState(() {
                            isChanged = newval!;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("Very Active"),
                        subtitle: Text("Spends most of the doing heavy physical activity(e.g Carpenter)",style: TextStyle(fontSize: 12.0),),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                                (route) => false);
                        //TODO Put the feedback popup after this screen for successfull completion of evaluation series then go to homepage
                      },
                      child: Text(
                        'Finish evaluation',
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
