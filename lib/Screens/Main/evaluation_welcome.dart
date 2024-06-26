import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Main/evaluation_one.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';


class EvaluationWelcomeScreen extends StatefulWidget {
  const EvaluationWelcomeScreen({super.key});

  @override
  State<EvaluationWelcomeScreen> createState() => _EvaluationWelcomeScreenState();
}

class _EvaluationWelcomeScreenState extends State<EvaluationWelcomeScreen> {
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
            SizedBox(
              height: SizeConfig.screenHeight * .1,
            ),
            Text('Welcome to Nutritz', style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.w700,fontFamily: 'Inter')),
            Text('Evaluation', style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.w700,fontFamily: 'Inter')),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
              child: Text('This evaluation will help fine tune the suggestions provided to you',style: TextStyle(color: AppColors.loginHintColor),textAlign: TextAlign.center,),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 430,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EvaluationQuestionOne()));
                      },
                      child: Text(
                        'Continue',
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


