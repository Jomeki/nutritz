import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../Resources/assets.dart';
import '../../../Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 143,
                      height: 88,
                      decoration: BoxDecoration(
                          color: AppColors.cardPurple,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'DAILY\nGOALS',
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontWeight: FontWeight.w700,color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: SizedBox(
                                    width: SizeConfig.screenWidth * .13,
                                    height: 20,
                                    child: FilledButton(
                                      onPressed: () {},
                                      child: Text(
                                        'More info',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 8,
                                            color: Colors.white),
                                      ),
                                      style: FilledButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CircularProgressIndicator(value: 0.6,
                                  strokeWidth: 8,
                                  backgroundColor: Colors.white,valueColor:  AlwaysStoppedAnimation<Color>(Colors.blueGrey),semanticsLabel: 'Complete',semanticsValue: '60',),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 8),
                                child: Text('COMPLETE',style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: 10),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 143,
                      height: 88,
                      decoration: BoxDecoration(
                          color: AppColors.cardYellow,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEEKLY\nGOALS',
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontWeight: FontWeight.w700,color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: SizedBox(
                                    width: SizeConfig.screenWidth * .13,
                                    height: 20,
                                    child: FilledButton(
                                      onPressed: () {},
                                      child: Text(
                                        'More info',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 8,
                                            color: Colors.white),
                                      ),
                                      style: FilledButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: CircularProgressIndicator(value: 0.6,
                                 strokeWidth: 8,
                                 backgroundColor: Colors.white,valueColor:  AlwaysStoppedAnimation<Color>(Colors.blueGrey),semanticsLabel: 'Complete',semanticsValue: '60',),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0,top: 8),
                               child: Text('COMPLETE',style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: 10),),
                             )
                           ],
                         )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 190,
                  height: 187,
                  decoration: BoxDecoration(
                      color: AppColors.cardGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,bottom: 16,top: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'MONTHLY\nGOALS',
                              style: TextStyle(
                                  fontFamily: 'Inter', fontWeight: FontWeight.w700,color: Colors.white,fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                width: SizeConfig.screenWidth * .15,
                                height: 25,
                                child: FilledButton(
                                  onPressed: () {},
                                  child: Text(
                                    'More info',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        color: Colors.white),
                                  ),
                                  style: FilledButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(24))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(value: 0.6,
                                strokeWidth: 8,
                                backgroundColor: Colors.white,valueColor:  AlwaysStoppedAnimation<Color>(Colors.blueGrey),semanticsLabel: 'Complete',semanticsValue: '60',),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 8),
                            child: Text('COMPLETE',style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: 10),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),child: Container(
            width: SizeConfig.screenWidth,
            height: 152,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryColor,width: 1)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, top: 4),
                      child: SizedBox(
                        width: SizeConfig.screenWidth * .3,
                        height: 40,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            padding: EdgeInsets.zero,
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weekly',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Icon(CupertinoIcons.chevron_down)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Text('You have no progress currently',style: TextStyle(fontFamily: 'Inter',fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.loginHintColor),),
                )
              ],
            ),
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your plans',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )),
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
                                              fontSize: 20),
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
                                              const EdgeInsets.only(top: 4),
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
