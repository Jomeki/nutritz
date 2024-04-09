import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Main/evaluation_four.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

class EvaluationQuestionThree extends StatefulWidget {
  const EvaluationQuestionThree({super.key});

  @override
  State<EvaluationQuestionThree> createState() => _EvaluationQuestionThreeState();
}

class _EvaluationQuestionThreeState extends State<EvaluationQuestionThree> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
  String selectedOption = "";
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                    child: Text('Do you have any food allergies?',textAlign: TextAlign.center,
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
                        value: selectedOption == 'Yes',
                        onChanged: (bool? value) => setState(() => selectedOption = value! ? 'Yes' : ''),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("Yes"),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: CheckboxListTile(
                        value: selectedOption == 'No',
                        onChanged: (bool? value) => setState(() => selectedOption = value! ? 'No' : ''),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.loginBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        activeColor: AppColors.primaryColor,
                        checkColor: Colors.white,
                        title: Text("No"),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EvaluationQuestionFour()));
                      },
                      child: Text(
                        'Next',
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
