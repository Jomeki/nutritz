import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Providers/appState.dart';
import 'package:nutriapp/Providers/evaluationProvider.dart';
import 'package:nutriapp/Providers/planProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/Main/evaluation_welcome.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:provider/provider.dart';
import '../../../Models/plans.dart';
import '../../../Themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LocalStorageProvider storageProvider;
  late PlansProvider plansProvider;
  late EvaluationProvider _evaluations;
  List<Plans> _plans = [];

  @override
  void didChangeDependencies() {
    storageProvider = Provider.of<LocalStorageProvider>(context);
    plansProvider = Provider.of<PlansProvider>(context);
    _evaluations = Provider.of<EvaluationProvider>(context);
    _plans = plansProvider.plans;
    super.didChangeDependencies();
  }

  bool evalcomplete = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: !_evaluations.isEvaluated,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(AssetsLoader.salad),
                          fit: BoxFit.fill,
                          opacity: 0.5)),
                  child:
                      //TODO Make this column disappear after user has completed evaluation series
                      Stack(
                          children: ([
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            evalcomplete = false;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      top: 16,
                      left: SizeConfig.screenWidth * .8,
                    ),
                    Column(
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
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EvaluationWelcomeScreen()),
                                    (route) => false);
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
                  ])),
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
                          storageProvider.user!.weight.toString(),
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
                          storageProvider.user!.height.toString(),
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
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
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
                      TextButton(
                        onPressed: () {
                          Provider.of<AppState>(context, listen: false)
                              .setBottomNavIndex(2);
                        },
                        child: Text(
                          'View all plans',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 610,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _plans.length > 5 ? 5 : _plans.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                                              _plans[i].name.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text:
                                                        'Duration: ${_plans[i].duration.toString()} days | ',
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13,
                                                        color: AppColors
                                                            .loginHintColor),
                                                    children: [
                                                  TextSpan(
                                                      text:
                                                          'Frequency: ${_plans[i].frequency.toString()}',
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
                                                width:
                                                    SizeConfig.screenWidth * .4,
                                                height: 35,
                                                child: FilledButton(
                                                  onPressed: () {
                                                    showCupertinoModalPopup(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Column(
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          128.0),
                                                                  child: Container(
                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white),
                                                                      height: 350,
                                                                      width: 380,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                DefaultTextStyle(style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w900), child: Text(_plans[i].name.toString())),
                                                                                GestureDetector(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.close,
                                                                                      color: Colors.red,
                                                                                    )),
                                                                              ],
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20.0,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                DefaultTextStyle(style: TextStyle(fontSize: 18.0, color: AppColors.loginHintColor, fontFamily: 'Inter', fontWeight: FontWeight.w900), child: Text('Description')),
                                                                                DefaultTextStyle(style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w400), child: Text(_plans[i].description.toString())),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20.0,
                                                                            ),
                                                                            SizedBox(
                                                                              width: SizeConfig.screenWidth * .55,
                                                                              height: 50,
                                                                              child: FilledButton(
                                                                                onPressed: () {
                                                                                  plansProvider.addEnrollment(user_id: storageProvider.user!.id.toString(), plan_id: _plans[i].id.toString());
                                                                                },
                                                                                child: Row(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.event_note_outlined,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'Add to my plan',
                                                                                      style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                style: FilledButton.styleFrom(backgroundColor: AppColors.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Text(
                                                    'View plan details',
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                  style: FilledButton.styleFrom(
                                                      backgroundColor: AppColors
                                                          .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24))),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      plansProvider.addEnrollment(
                                          user_id: storageProvider.user!.id
                                              .toString(),
                                          plan_id: _plans[i].id.toString());
                                      //TODO: NOTIFY THE USER IF THEY HAVE SUBSCRIBED TO THE PLAN
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
