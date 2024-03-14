import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/Main/evaluation_welcome.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';

import '../../../Themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: SizeConfig.screenWidth,
              height: 190,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(AssetsLoader.salad),
                      fit: BoxFit.fill,
                      opacity: 0.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Find your plan',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Take a quick test so that we can improve suggestions for you',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .4,
                      height: 40,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const EvaluationWelcomeScreen()), (route) => false);
                        },
                        child: Text(
                          'Start Evaluation',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 108,
                  decoration: BoxDecoration(
                      color: AppColors.cardPurple,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.balance,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '100KG',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 108,
                  decoration: BoxDecoration(
                      color: AppColors.cardYellow,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.height_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '160CM',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 108,
                  decoration: BoxDecoration(
                      color: AppColors.cardGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.balance,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'BMI',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '9.8KG/CM',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Suggestions for you',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  'View all plans',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: 110,
                          decoration: BoxDecoration(
                            color: AppColors.suggestionsCard,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.calendar_today_outlined,
                                      size: 32,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Low Carbs',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: 'Duration: 28 days | ',
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 13,
                                                    color: AppColors
                                                        .loginHintColor),
                                                children: [
                                              TextSpan(
                                                  text: 'Frequency: Daily',
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 13,
                                                      color: AppColors
                                                          .loginHintColor))
                                            ])),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: SizedBox(
                                            width: SizeConfig.screenWidth * .4,
                                            height: 35,
                                            child: FilledButton(
                                              onPressed: () {},
                                              child: Text(
                                                'View plan details',
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              style: FilledButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.event_note_outlined,
                                      color: AppColors.primaryColor,
                                      size: 28,
                                    ),
                                    Text(
                                      'Add to my plan',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
