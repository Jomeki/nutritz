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

  int selectedIndex = -1;
  List <Map<String,String>> options = [
  {'title':'Loose weight','description':'This nutritional goal aims at improving the quality of food intake'},
  {'title':'Eat Healthy','description':'This nutritional goal aims at improving the quality of food intake'},
  {'title':'Manage Stress','description':'This nutritional goal aims at improving the quality of food intake'},
  {'title':'Disease Prevention','description':'This nutritional goal aims at improving the quality of food intake'},
  {'title':'Others','description':'Describe the nutritional goal you intend to achieve'},
  ];

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
              height: 30.0,
            ),
            Text('What is your goal?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter')),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 480,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: CheckboxListTile(
                            title: Text(options[index]['title']!),
                            subtitle: Text(options[index]['description']!),
                            value: selectedIndex ==
                                index, // Check if current option is selected
                            onChanged: (bool? value) => setState(
                                () => selectedIndex = value! ? index : -1),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.loginBorderColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            activeColor: AppColors.primaryColor,
                            checkColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  if (selectedIndex == 4)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Tell us about your goal',
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
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
