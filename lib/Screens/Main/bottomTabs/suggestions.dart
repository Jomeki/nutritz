import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:nutriapp/Models/plans.dart';
import 'package:nutriapp/Providers/foodsProvider.dart';
import 'package:nutriapp/Providers/planProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:provider/provider.dart';
import '../../../Models/foods.dart';
import '../../../Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';

class DietSuggestions extends StatefulWidget {
  const DietSuggestions({super.key});

  @override
  State<DietSuggestions> createState() => _DietSuggestionsState();
}

class _DietSuggestionsState extends State<DietSuggestions> {
  late FoodsProvider _foodsProvider;
  late PlansProvider _plansProvider;
  late LocalStorageProvider _storageProvider;
  List<Foods> _foods = [];
  List<Foods> _paginatedFoods = [];
  List<Plans> _plans = [];
  List<Plans> _paginatedPlans = [];


  int _initialPlanIndex = 0;
  int _planStartRange = 0;
  int _planEndRange = 5;



  int _initialFoodIndex = 0;
  int _foodStartRange = 0;
  int _foodEndRange = 5;

  @override
  void didChangeDependencies() {
    _storageProvider = Provider.of<LocalStorageProvider>(context);
    _plansProvider = Provider.of<PlansProvider>(context);
    _plans = _plansProvider.plans;
    _foodsProvider = Provider.of<FoodsProvider>(context);
    _foods = _foodsProvider.foods;
    try{
      _paginatedPlans = _plans.getRange(_planStartRange, _planEndRange).toList();
    }catch(e){
      _paginatedPlans = _plans.getRange(_planStartRange, _planStartRange+(_plans.length%5)).toList();
    }

    try{
      _paginatedFoods = _foods.getRange(_foodStartRange, _foodEndRange).toList();
    }catch(e){
      _paginatedFoods = _foods.getRange(_foodStartRange, _foodStartRange+(_foods.length%5)).toList();
    }



    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Suggested meal plans',
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'FATS',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '50g/day',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 23),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      width: SizeConfig.screenWidth * .3,
                                      height: 32,
                                      child: FilledButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
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
                                                                          'FATS FOOD \nSUGGESTION SUMMARY')),
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
                                                                          fontWeight: FontWeight
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
                                          'View Details',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //TODO Fix spacing of the suggested foods and your plan containers and make the whole page scrollable
                      Container(
                        width: 170,
                        height: 120,
                        decoration: BoxDecoration(
                            color: AppColors.cardYellow,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CARBS',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '150g/day',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 23),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      width: SizeConfig.screenWidth * .3,
                                      height: 32,
                                      child: FilledButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
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
                                                                          'CARB FOOD \nSUGGESTION SUMMARY')),
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
                                                                          fontWeight: FontWeight
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
                                          'View Details',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PROTEIN',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 13),
                              ),
                              Text(
                                '250g/day',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially ',
                                  style: TextStyle(
                                      fontSize: 7, fontFamily: 'Inter'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: SizedBox(
                                  width: SizeConfig.screenWidth * .3,
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
                                                height: SizeConfig.screenHeight,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        color: Colors.white),
                                                    height: 350,
                                                    width: 380,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              24.0),
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
                                                                      'PROTEIN FOOD \nSUGGESTION SUMMARY')),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
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
                                      'View Details',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            //TODO list 5 elements at a time and enable user to scroll horizontally in this section
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Suggested Foods',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 590,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _paginatedFoods.length,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 128.0),
                                        child: SizedBox(
                                          height: SizeConfig.screenHeight,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors.white),
                                              height: 350,
                                              width: 380,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        DefaultTextStyle(
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                            child: Text(_paginatedFoods[
                                                                    i]
                                                                .name
                                                                .toString())),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.red,
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
                                                                fontSize: 15.0,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            child: Text(_paginatedFoods[
                                                                    i]
                                                                .description
                                                                .toString())),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                width: SizeConfig.screenWidth,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: AppColors.foodsCard,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child:
                                              Image.asset(AssetsLoader.banana)),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _paginatedFoods[i].name.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                _paginatedFoods[i]
                                                    .description
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: NumberPaginator(
                    numberPages: _foods.length ~/ 5+(_foods.length%5<5?1:0),
                    onPageChange: (index) {
                      if (index > _initialFoodIndex) {
                        setState(() {
                          _initialFoodIndex = index;
                          _foodStartRange += 5;
                          _foodEndRange += 5;
                          try{
                            _paginatedFoods = _foods.getRange(_foodStartRange, _foodEndRange).toList();
                          }catch(e){
                            _paginatedFoods = _foods.getRange(_foodStartRange, _foodStartRange+(_foods.length%5)).toList();
                          }

                        });
                      } else {
                        if (index > 0) {
                          setState(() {
                            _initialFoodIndex = index;
                            _foodStartRange -= 5;
                            _foodEndRange -= 5;
                            try{
                              _paginatedFoods = _foods.getRange(_foodStartRange, _foodEndRange).toList();
                            }catch(e){
                              _paginatedFoods = _foods.getRange(_foodStartRange, _foodStartRange+(_foods.length%5)).toList();
                            }
                          });
                        }
                        if(index==0){
                          setState(() {
                            _initialFoodIndex = 0;
                            _foodStartRange = 0;
                            _foodEndRange = 5;
                            try{
                              _paginatedFoods = _foods.getRange(_foodStartRange, _foodEndRange).toList();
                            }catch(e){
                              _paginatedFoods = _foods.getRange(_foodStartRange, _foodStartRange+(_foods.length%5)).toList();
                            }
                          });
                        }
                      }
                    },
                    config: NumberPaginatorUIConfig(
                      buttonSelectedBackgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                  child: Divider(
                    color: Colors.black12,
                  ),
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),
            //TODO list 5 elements at a time and enable user to scroll vertically in this section
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Suggested plans',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 590,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _paginatedPlans.length,
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
                                              _paginatedPlans[i].name.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text:
                                                        'Duration: ${_paginatedPlans[i].duration.toString()} days | ',
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
                                                          'Frequency: ${_paginatedPlans[i].frequency.toString()}',
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
                                                                                DefaultTextStyle(style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w900), child: Text(_paginatedPlans[i].name.toString())),
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
                                                                                DefaultTextStyle(style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w400), child: Text(_paginatedPlans[i].description.toString())),
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
                                                                                  _plansProvider.addEnrollment(user_id: _storageProvider.user!.id.toString(), plan_id: _paginatedPlans[i].id.toString());
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
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
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: NumberPaginator(
                    initialPage: 0,
                    numberPages: _plans.length ~/ 5+(_plans.length%5<5?1:0),
                    onPageChange: (index) {
                      if (index > _initialPlanIndex) {
                        setState(() {
                          _initialPlanIndex = index;
                          _planStartRange += 5;
                          _planEndRange += 5;

                          try{
                            _paginatedPlans = _plans.getRange(_planStartRange, _planEndRange).toList();
                          }catch(e){
                            _paginatedPlans = _plans.getRange(_planStartRange, _planStartRange+(_plans.length%5)).toList();
                          }
                        });
                      } else {
                        if (index > 0) {
                          setState(() {
                            _initialPlanIndex = index;
                            _planStartRange -= 5;
                            _planEndRange -= 5;
                            try{
                              _paginatedPlans = _plans.getRange(_planStartRange, _planEndRange).toList();
                            }catch(e){
                              _paginatedPlans = _plans.getRange(_planStartRange, _planStartRange+(_plans.length%5)).toList();
                            }
                          });
                        }
                        if(index==0){
                          setState(() {
                            _initialPlanIndex = 0;
                            _planStartRange = 0;
                            _planEndRange = 5;
                            try{
                              _paginatedPlans = _plans.getRange(_planStartRange, _planEndRange).toList();
                            }catch(e){
                              _paginatedPlans = _plans.getRange(_planStartRange, _planStartRange+(_plans.length%5)).toList();
                            }
                          });
                        }
                      }
                    },
                    config: NumberPaginatorUIConfig(
                      buttonSelectedBackgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
