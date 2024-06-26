import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Models/goalsplan.dart';
import 'package:nutriapp/Providers/goalsplanProvider.dart';
import 'package:nutriapp/Providers/progressProvider.dart';
import 'package:provider/provider.dart';
import '../../../Models/enrollement.dart';
import '../../../Models/progress.dart';
import '../../../Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';
import '../../../Widgets/graphs/line_chart_card.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var Timelines = ["Daily", "Weekly", "Monthly"];
  String dropdownvalue = "Time";

  bool progress = true;

  late GoalsPlanProvider _plansProvider;
  List<GoalsPlan> _plans = [];

  late ProgressProvider _progressProvider;
  Progress? _progress;

  List<Enrollement> _enrollement = [];

  @override
  void didChangeDependencies() {
    _plansProvider = Provider.of<GoalsPlanProvider>(context);
    _progressProvider = Provider.of<ProgressProvider>(context);

    _progress = _progressProvider.progress;
    _plans = _plansProvider.goalsplan;
    _enrollement = _plansProvider.enrollement;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your achievements',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )),
              ),
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
                                      'DAILY\nPLANS',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 4),
                                    //   child: SizedBox(
                                    //     width: SizeConfig.screenWidth * .15,
                                    //     height: 32,
                                    //     child: FilledButton(
                                    //       onPressed: () {
                                    //         showCupertinoModalPopup(
                                    //             context: context,
                                    //             builder:
                                    //                 (BuildContext context) {
                                    //               return Padding(
                                    //                 padding: const EdgeInsets
                                    //                     .symmetric(
                                    //                     horizontal: 2.0,
                                    //                     vertical: 32.0),
                                    //                 child: SizedBox(
                                    //                   height: SizeConfig
                                    //                       .screenHeight,
                                    //                   child: Container(
                                    //                       decoration: BoxDecoration(
                                    //                           borderRadius:
                                    //                               BorderRadius
                                    //                                   .circular(
                                    //                                       8.0),
                                    //                           color:
                                    //                               Colors.white),
                                    //                       height: 350,
                                    //                       width: 380,
                                    //                       child: Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                 .all(24.0),
                                    //                         child: Column(
                                    //                           crossAxisAlignment:
                                    //                               CrossAxisAlignment
                                    //                                   .start,
                                    //                           children: [
                                    //                             Row(
                                    //                               children: [
                                    //                                 DefaultTextStyle(
                                    //                                     style: TextStyle(
                                    //                                         fontSize:
                                    //                                             20.0,
                                    //                                         color: Colors
                                    //                                             .black,
                                    //                                         fontFamily:
                                    //                                             'Inter',
                                    //                                         fontWeight: FontWeight
                                    //                                             .w900),
                                    //                                     child: Text(
                                    //                                         'DAILY GOALS SUMMARY')),
                                    //                                 GestureDetector(
                                    //                                     onTap:
                                    //                                         () {
                                    //                                       Navigator.pop(
                                    //                                           context);
                                    //                                     },
                                    //                                     child:
                                    //                                         Icon(
                                    //                                       Icons
                                    //                                           .close,
                                    //                                       color:
                                    //                                           Colors.red,
                                    //                                     )),
                                    //                               ],
                                    //                               mainAxisAlignment:
                                    //                                   MainAxisAlignment
                                    //                                       .spaceBetween,
                                    //                             ),
                                    //                             SizedBox(
                                    //                               height: 20.0,
                                    //                             ),
                                    //                             Column(
                                    //                               children: [
                                    //                                 DefaultTextStyle(
                                    //                                     style: TextStyle(
                                    //                                         fontSize:
                                    //                                             18.0,
                                    //                                         color: AppColors
                                    //                                             .loginHintColor,
                                    //                                         fontFamily:
                                    //                                             'Inter',
                                    //                                         fontWeight: FontWeight
                                    //                                             .w900),
                                    //                                     child: Text(
                                    //                                         'Details about the daily goals report goes here')),
                                    //                               ],
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       )),
                                    //                 ),
                                    //               );
                                    //             });
                                    //       },
                                    //       child: Text(
                                    //         'More info',
                                    //         style: TextStyle(
                                    //             fontFamily: 'Inter',
                                    //             fontWeight: FontWeight.w300,
                                    //             fontSize: 8,
                                    //             color: Colors.white),
                                    //       ),
                                    //       style: FilledButton.styleFrom(
                                    //           padding: EdgeInsets.zero,
                                    //           backgroundColor: Colors.black,
                                    //           shape: RoundedRectangleBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       24))),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              child: CircularProgressIndicator(
                                                value:_progress!=null? (int.parse(_progress!.userdailydata.toString())/100):0,
                                                strokeWidth: 8,
                                                backgroundColor: Colors.white,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.blueGrey),
                                                semanticsLabel: 'Progress',
                                                semanticsValue: "${_progress?.userdailydata.toString()}",
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                            Positioned(
                                              child: Text(
                                                "${_progress?.userdailydata.toString()}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              top: 13,
                                              left: 20,
                                            )
                                          ],
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: Text(
                                        'COMPLETED',
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
                                      'WEEKLY\nPLANS',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 4),
                                    //   child: SizedBox(
                                    //     width: SizeConfig.screenWidth * .15,
                                    //     height: 32,
                                    //     child: FilledButton(
                                    //       onPressed: () {
                                    //         showCupertinoModalPopup(
                                    //             context: context,
                                    //             builder:
                                    //                 (BuildContext context) {
                                    //               return Padding(
                                    //                 padding: const EdgeInsets
                                    //                     .symmetric(
                                    //                     horizontal: 2.0,
                                    //                     vertical: 32.0),
                                    //                 child: SizedBox(
                                    //                   height: SizeConfig
                                    //                       .screenHeight,
                                    //                   child: Container(
                                    //                       decoration: BoxDecoration(
                                    //                           borderRadius:
                                    //                               BorderRadius
                                    //                                   .circular(
                                    //                                       8.0),
                                    //                           color:
                                    //                               Colors.white),
                                    //                       height: 350,
                                    //                       width: 380,
                                    //                       child: Padding(
                                    //                         padding:
                                    //                             const EdgeInsets
                                    //                                 .all(24.0),
                                    //                         child: Column(
                                    //                           crossAxisAlignment:
                                    //                               CrossAxisAlignment
                                    //                                   .start,
                                    //                           children: [
                                    //                             Row(
                                    //                               children: [
                                    //                                 DefaultTextStyle(
                                    //                                     style: TextStyle(
                                    //                                         fontSize:
                                    //                                             18.0,
                                    //                                         color: Colors
                                    //                                             .black,
                                    //                                         fontFamily:
                                    //                                             'Inter',
                                    //                                         fontWeight: FontWeight
                                    //                                             .w900),
                                    //                                     child: Text(
                                    //                                         'WEEKLY GOALS SUMMARY')),
                                    //                                 GestureDetector(
                                    //                                     onTap:
                                    //                                         () {
                                    //                                       Navigator.pop(
                                    //                                           context);
                                    //                                     },
                                    //                                     child:
                                    //                                         Icon(
                                    //                                       Icons
                                    //                                           .close,
                                    //                                       color:
                                    //                                           Colors.red,
                                    //                                     )),
                                    //                               ],
                                    //                               mainAxisAlignment:
                                    //                                   MainAxisAlignment
                                    //                                       .spaceBetween,
                                    //                             ),
                                    //                             SizedBox(
                                    //                               height: 20.0,
                                    //                             ),
                                    //                             Column(
                                    //                               children: [
                                    //                                 DefaultTextStyle(
                                    //                                     style: TextStyle(
                                    //                                         fontSize:
                                    //                                             18.0,
                                    //                                         color: AppColors
                                    //                                             .loginHintColor,
                                    //                                         fontFamily:
                                    //                                             'Inter',
                                    //                                         fontWeight: FontWeight
                                    //                                             .w900),
                                    //                                     child: Text(
                                    //                                         'Details about the weekly goals report goes here')),
                                    //                               ],
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       )),
                                    //                 ),
                                    //               );
                                    //             });
                                    //       },
                                    //       child: Text(
                                    //         'More info',
                                    //         style: TextStyle(
                                    //             fontFamily: 'Inter',
                                    //             fontWeight: FontWeight.w300,
                                    //             fontSize: 8,
                                    //             color: Colors.white),
                                    //       ),
                                    //       style: FilledButton.styleFrom(
                                    //           padding: EdgeInsets.zero,
                                    //           backgroundColor: Colors.black,
                                    //           shape: RoundedRectangleBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       24))),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            child: CircularProgressIndicator(
                                              value:_progress!=null? (int.parse(_progress!.userweeklydata.toString())/100):0,
                                              strokeWidth: 8,
                                              backgroundColor: Colors.white,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.blueGrey),
                                              semanticsLabel: 'Complete',
                                              semanticsValue: "${_progress?.userweeklydata.toString()}",
                                            ),
                                            height: 50,
                                            width: 50,
                                          ),
                                          Positioned(
                                            child: Text(
                                              "${_progress?.userweeklydata.toString()}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            top: 13,
                                            left: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8.0),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 16, top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                    'MONTHLY PLANS',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 4),
                                //   child: SizedBox(
                                //     width: SizeConfig.screenWidth * .15,
                                //     height: 32,
                                //     child: FilledButton(
                                //       onPressed: () {
                                //         showCupertinoModalPopup(
                                //             context: context,
                                //             builder: (BuildContext context) {
                                //               return Padding(
                                //                 padding:
                                //                     const EdgeInsets.symmetric(
                                //                         horizontal: 2.0,
                                //                         vertical: 32.0),
                                //                 child: SizedBox(
                                //                   height:
                                //                       SizeConfig.screenHeight,
                                //                   child: Container(
                                //                       decoration: BoxDecoration(
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                                       8.0),
                                //                           color: Colors.white),
                                //                       height: 350,
                                //                       width: 380,
                                //                       child: Padding(
                                //                         padding:
                                //                             const EdgeInsets
                                //                                 .all(24.0),
                                //                         child: Column(
                                //                           crossAxisAlignment:
                                //                               CrossAxisAlignment
                                //                                   .start,
                                //                           children: [
                                //                             Row(
                                //                               children: [
                                //                                 DefaultTextStyle(
                                //                                     style: TextStyle(
                                //                                         fontSize:
                                //                                             18.0,
                                //                                         color: Colors
                                //                                             .black,
                                //                                         fontFamily:
                                //                                             'Inter',
                                //                                         fontWeight:
                                //                                             FontWeight
                                //                                                 .w900),
                                //                                     child: Text(
                                //                                         'MONTHLY GOALS SUMMARY')),
                                //                                 GestureDetector(
                                //                                     onTap: () {
                                //                                       Navigator.pop(
                                //                                           context);
                                //                                     },
                                //                                     child: Icon(
                                //                                       Icons
                                //                                           .close,
                                //                                       color: Colors
                                //                                           .red,
                                //                                     )),
                                //                               ],
                                //                               mainAxisAlignment:
                                //                                   MainAxisAlignment
                                //                                       .spaceBetween,
                                //                             ),
                                //                             SizedBox(
                                //                               height: 20.0,
                                //                             ),
                                //                             Column(
                                //                               children: [
                                //                                 DefaultTextStyle(
                                //                                     style: TextStyle(
                                //                                         fontSize:
                                //                                             18.0,
                                //                                         color: AppColors
                                //                                             .loginHintColor,
                                //                                         fontFamily:
                                //                                             'Inter',
                                //                                         fontWeight:
                                //                                             FontWeight
                                //                                                 .w900),
                                //                                     child: Text(
                                //                                         'Details about the monthly goals report goes here')),
                                //                               ],
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       )),
                                //                 ),
                                //               );
                                //             });
                                //       },
                                //       child: Text(
                                //         'More info',
                                //         style: TextStyle(
                                //             fontFamily: 'Inter',
                                //             fontWeight: FontWeight.w300,
                                //             fontSize: 10,
                                //             color: Colors.white),
                                //       ),
                                //       style: FilledButton.styleFrom(
                                //           padding: EdgeInsets.zero,
                                //           backgroundColor: Colors.black,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(24))),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          child: CircularProgressIndicator(
                                            value: _progress!=null?(int.parse(_progress!.userdailymonthly.toString())/100):null,
                                            strokeWidth: 10,
                                            backgroundColor: Colors.white,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.blueGrey),
                                            semanticsLabel: 'Complete',
                                            semanticsValue: "${_progress?.userdailymonthly.toString()}",
                                          ),
                                          width: 300,
                                          height: 300,
                                        ),
                                        Positioned(
                                          child: Text(
                                            "${_progress?.userdailymonthly.toString()}",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          top: 25,
                                          left: 36,
                                        )
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'COMPLETED',
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
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //   child: Container(
              //     width: SizeConfig.screenWidth,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         border:
              //             Border.all(color: AppColors.primaryColor, width: 1)),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(right: 8, top: 8),
              //               child: SizedBox(
              //                 width: SizeConfig.screenWidth * .35,
              //                 height: 60,
              //                 child: DropdownButtonFormField(
              //                   iconEnabledColor: Colors.white,
              //                   dropdownColor: AppColors.primaryColor,
              //                   style: TextStyle(color: Colors.white),
              //                   decoration: InputDecoration(
              //                     hintText: 'Timeframe',
              //                     hintStyle: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 12.0,
              //                     ),
              //                     filled: true,
              //                     fillColor: AppColors.primaryColor,
              //                     border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(24),
              //                         borderSide: BorderSide(
              //                             width: 1,
              //                             color: AppColors.primaryColor)),
              //                     enabledBorder: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(24),
              //                         borderSide: BorderSide(
              //                             width: 1,
              //                             color: AppColors.primaryColor)),
              //                     disabledBorder: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(24),
              //                         borderSide: BorderSide(
              //                             width: 1,
              //                             color: AppColors.primaryColor)),
              //                     focusedBorder: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(24),
              //                         borderSide: BorderSide(
              //                             width: 1,
              //                             color: AppColors.primaryColor)),
              //                   ),
              //                   items: Timelines.map((e) {
              //                     return DropdownMenuItem(
              //                       value: e,
              //                       child: Text(e),
              //                     );
              //                   }).toList(),
              //                   onChanged: (String? newvalue) {
              //                     setState(() {
              //                       dropdownvalue = newvalue!;
              //                     });
              //                   },
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         // SizedBox(
              //         //   height: 30,
              //         // ),
              //         if (progress) ...[
              //           LineChartCard()
              //         ] else ...[
              //           Align(
              //             alignment: Alignment.center,
              //             child: Text(
              //               'You have no progress currently',
              //               style: TextStyle(
              //                   fontFamily: 'Inter',
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w400,
              //                   color: AppColors.loginHintColor),
              //             ),
              //           )
              //         ]
              //       ],
              //     ),
              //   ),
              // ),
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

              if (_enrollement.isEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 146),
                    child: Text(
                      'You have no active plans currently',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.loginHintColor),
                    ),
                  ),
                ),
              if (_enrollement.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _enrollement.length,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              tileColor: AppColors.suggestionsCard,
                              trailing: IconButton(
                                icon: Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                "Are you sure you want to unenroll from this nutritional plan?"),
                                            content: Text(
                                                "You are about to unenroll from the ${_enrollement[i].plan!.name}"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancel")),
                                              TextButton(
                                                  onPressed: () async {
                                                    await _plansProvider
                                                        .unenrollPlan(
                                                            enrollment_id:
                                                                _enrollement[i]
                                                                    .id
                                                                    .toString());
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Confirm"))
                                            ],
                                          ));
                                },
                              ),
                              title: Text(_enrollement[i]
                                  .plan!
                                  .name
                                  .toString()
                                  .toUpperCase()),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(_enrollement[i]
                                        .plan!
                                        .description
                                        .toString()),
                                  ),
                                  Text((_enrollement[i].completion_status)
                                              .toString() ==
                                          '1'
                                      ? "Status: Completed"
                                      : "Status: Not Completed"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: SizedBox(
                                      width: SizeConfig.screenWidth * .55,
                                      height: 45,
                                      child: FilledButton(
                                        onPressed: () async {
                                          await _plansProvider.completePlan(
                                              plan_id: _enrollement[i]
                                                  .plan_id
                                                  .toString(),
                                              progress_category: _enrollement[i]
                                                  .plan!
                                                  .frequency
                                                  .toString());

                                          if(_plansProvider.isCompleted){
                                          showDialog(context: context, builder: (context)=>AlertDialog(
                                            title: Text("Plan complete"),
                                            content: Text("You have successfully completed the ${_enrollement[i].plan!.name}. Thank you for using nutritz"),
                                            actions: [
                                              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Close"))
                                            ],
                                          ));}else {
                                            showDialog(context: context, builder: (context)=>AlertDialog(
                                              title: Text("Failed to complete plan"),
                                              content: Text("Failed to complete the ${_enrollement[i].plan!.name}. Please check you network connection and try again later"),
                                              actions: [
                                                TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Close"))
                                              ],
                                            ));
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              'Complete Plan',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        style: FilledButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(28))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                )
            ],
          ),
        ),
      ),
    );
  }
}
