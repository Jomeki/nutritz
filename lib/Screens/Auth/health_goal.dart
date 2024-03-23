import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

class HealthGoalScreen extends StatefulWidget {
  const HealthGoalScreen({super.key});

  @override
  State<HealthGoalScreen> createState() => _HealthGoalScreenState();
}

class _HealthGoalScreenState extends State<HealthGoalScreen> {
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
              height: 90.0,
            ),
            Text('What is your goal?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter')),
            SizedBox(
              height: 30.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO Fix checking mechanism for all checkboxes
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
                        title: Text("Loose weight"),
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
                        title: Text("Eat Healthy"),
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
                        title: Text("Manage Stress"),
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
                        title: Text("Disease Prevention"),
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
                        title: Text("Others"),
                        side: BorderSide(
                            width: 1, color: AppColors.primaryColor)),
                  ),
                  SizedBox(
                    height: 90.0,
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
