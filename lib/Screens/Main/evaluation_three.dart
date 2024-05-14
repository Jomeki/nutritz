import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Main/evaluation_four.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

class EvaluationQuestionThree extends StatefulWidget {
  const EvaluationQuestionThree({super.key});

  @override
  State<EvaluationQuestionThree> createState() =>
      _EvaluationQuestionThreeState();
}

class _EvaluationQuestionThreeState extends State<EvaluationQuestionThree> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
  String selectedOption = "";
  int _selectedValue = 0;
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text('Do you have any food allergies?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RadioListTile(
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                        title: Text("Yes"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: AppColors.loginBorderColor),
                            borderRadius: BorderRadius.circular(8)),
                        selectedTileColor: AppColors.primaryColor,
                      )),
                  if (_selectedValue == 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Allergies',
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
                      padding: const EdgeInsets.all(16.0),
                      child: RadioListTile(
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                        title: Text("No"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: AppColors.loginBorderColor),
                            borderRadius: BorderRadius.circular(8)),
                        selectedTileColor: AppColors.primaryColor,
                      )),
                  SizedBox(
                    height: 330.0,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EvaluationQuestionFour()));
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
