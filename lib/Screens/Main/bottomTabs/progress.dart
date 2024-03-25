import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var Timelines = ["Daily", "Weekly", "Monthly"];
  String dropdownvalue = "Time";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 170,
                          height: 120,
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
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: SizedBox(
                                        width: SizeConfig.screenWidth * .15,
                                        height: 32,
                                        child: FilledButton(
                                          onPressed: () {
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 2.0,
                                                        vertical: 32.0),
                                                    child: SizedBox(
                                                      height: SizeConfig
                                                          .screenHeight,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              color:
                                                                  Colors.white),
                                                          height: 350,
                                                          width: 380,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(24.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    DefaultTextStyle(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20.0,
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight: FontWeight
                                                                                .w900),
                                                                        child: Text(
                                                                            'DAILY GOALS SUMMARY')),
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              Colors.red,
                                                                        )),
                                                                  ],
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                ),
                                                                SizedBox(
                                                                  height: 20.0,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    DefaultTextStyle(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18.0,
                                                                            color: AppColors
                                                                                .loginHintColor,
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight: FontWeight
                                                                                .w900),
                                                                        child: Text(
                                                                            'Details about the daily goals report goes here')),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  );
                                                });
                                          },
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircularProgressIndicator(
                                        value: 0.6,
                                        strokeWidth: 8,
                                        backgroundColor: Colors.white,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blueGrey),
                                        semanticsLabel: 'Complete',
                                        semanticsValue: '60',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: Text(
                                        'COMPLETE',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 170,
                          height: 120,
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
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: SizedBox(
                                        width: SizeConfig.screenWidth * .15,
                                        height: 32,
                                        child: FilledButton(
                                          onPressed: () {
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 2.0,
                                                        vertical: 32.0),
                                                    child: SizedBox(
                                                      height: SizeConfig
                                                          .screenHeight,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              color:
                                                                  Colors.white),
                                                          height: 350,
                                                          width: 380,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(24.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    DefaultTextStyle(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18.0,
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight: FontWeight
                                                                                .w900),
                                                                        child: Text(
                                                                            'WEEKLY GOALS SUMMARY')),
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              Colors.red,
                                                                        )),
                                                                  ],
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                ),
                                                                SizedBox(
                                                                  height: 20.0,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    DefaultTextStyle(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18.0,
                                                                            color: AppColors
                                                                                .loginHintColor,
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight: FontWeight
                                                                                .w900),
                                                                        child: Text(
                                                                            'Details about the weekly goals report goes here')),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  );
                                                });
                                          },
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircularProgressIndicator(
                                        value: 0.6,
                                        strokeWidth: 8,
                                        backgroundColor: Colors.white,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blueGrey),
                                        semanticsLabel: 'Complete',
                                        semanticsValue: '60',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: Text(
                                        'COMPLETE',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                          color: AppColors.cardGreen,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 16, top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'MONTHLY\nGOALS',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: SizedBox(
                                    width: SizeConfig.screenWidth * .15,
                                    height: 32,
                                    child: FilledButton(
                                      onPressed: () {
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0,
                                                        vertical: 32.0),
                                                child: SizedBox(
                                                  height:
                                                      SizeConfig.screenHeight,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          color: Colors.white),
                                                      height: 350,
                                                      width: 380,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900),
                                                                    child: Text(
                                                                        'MONTHLY GOALS SUMMARY')),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                            ),
                                                            SizedBox(
                                                              height: 20.0,
                                                            ),
                                                            Column(
                                                              children: [
                                                                DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        color: AppColors
                                                                            .loginHintColor,
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900),
                                                                    child: Text(
                                                                        'Details about the monthly goals report goes here')),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                              );
                                            });
                                      },
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
                                              borderRadius:
                                                  BorderRadius.circular(24))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  strokeWidth: 10,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blueGrey),
                                  semanticsLabel: 'Complete',
                                  semanticsValue: '60',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'COMPLETE',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Container(
                  width: SizeConfig.screenWidth,
                  //TODO Increase size of this box to 230 after making the whole page scrollable
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1)),
                  //TODO Graph of number of achievements against date
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 8),
                            child: SizedBox(
                              width: SizeConfig.screenWidth * .35,
                              height: 60,
                              child: DropdownButtonFormField(
                                iconEnabledColor: Colors.white,
                                dropdownColor: AppColors.primaryColor,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Timeframe',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.primaryColor,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.primaryColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.primaryColor)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.primaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.primaryColor)),
                                ),
                                items: Timelines.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    dropdownvalue = newvalue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'You have no progress currently',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.loginHintColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
              //TODO A table showing subscribed plans and completion status goes here
              SizedBox(
                height: 32.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'You have no plans currently',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.loginHintColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
