import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Resources/assets.dart';
import '../../../Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';

class DietSuggestions extends StatefulWidget {
  const DietSuggestions({super.key});

  @override
  State<DietSuggestions> createState() => _DietSuggestionsState();
}

class _DietSuggestionsState extends State<DietSuggestions> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,),
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
                                        showCupertinoModalPopup(context: context, builder: (BuildContext context){
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 32.0),
                                            child: SizedBox(
                                              height:SizeConfig.screenHeight,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      color: Colors.white
                                                  ),
                                                  height: 350,
                                                  width: 380,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(24.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                child: Text('FATS FOOD \nSUGGESTION SUMMARY')),
                                                            GestureDetector(onTap: () { Navigator.pop(context); },
                                                                child: Icon(Icons.close,color: Colors.red,)),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        ),
                                                        SizedBox(height: 20.0,),
                                                        Column(
                                                          children: [
                                                            DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                child: Text('Details about the monthly goals report goes here')),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ),
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
                                        showCupertinoModalPopup(context: context, builder: (BuildContext context){
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 32.0),
                                            child: SizedBox(
                                              height:SizeConfig.screenHeight,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      color: Colors.white
                                                  ),
                                                  height: 350,
                                                  width: 380,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(24.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                child: Text('CARB FOOD \nSUGGESTION SUMMARY')),
                                                            GestureDetector(onTap: () { Navigator.pop(context); },
                                                                child: Icon(Icons.close,color: Colors.red,)),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        ),
                                                        SizedBox(height: 20.0,),
                                                        Column(
                                                          children: [
                                                            DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                child: Text('Details about the monthly goals report goes here')),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ),
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
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially ',
                                style:
                                    TextStyle(fontSize: 7, fontFamily: 'Inter'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                width: SizeConfig.screenWidth * .3,
                                height: 32,
                                child: FilledButton(
                                  onPressed: () {
                                    showCupertinoModalPopup(context: context, builder: (BuildContext context){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 32.0),
                                        child: SizedBox(
                                          height:SizeConfig.screenHeight,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  color: Colors.white
                                              ),
                                              height: 350,
                                              width: 380,
                                              child: Padding(
                                                padding: const EdgeInsets.all(24.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                            child: Text('PROTEIN FOOD \nSUGGESTION SUMMARY')),
                                                        GestureDetector(onTap: () { Navigator.pop(context); },
                                                            child: Icon(Icons.close,color: Colors.red,)),
                                                      ],
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    ),
                                                    SizedBox(height: 20.0,),
                                                    Column(
                                                      children: [
                                                        DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                            child: Text('Details about the monthly goals report goes here')),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                          ),
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

          //TODO list 5 elements at a time and enable user to scroll horizontally in this section
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
          Expanded(
            flex: 5,
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
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
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset(AssetsLoader.banana)),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      showCupertinoModalPopup(context: context, builder: (BuildContext context){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 32.0),
                                          child: SizedBox(
                                            height:SizeConfig.screenHeight,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    color: Colors.white
                                                ),
                                                height: 350,
                                                width: 380,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(24.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                              child: Text('Bananas')),
                                                          GestureDetector(onTap: () { Navigator.pop(context); },
                                                              child: Icon(Icons.close,color: Colors.red,)),
                                                        ],
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      ),
                                                      SizedBox(height: 20.0,),
                                                      Column(
                                                        children: [
                                                          DefaultTextStyle(style: TextStyle(fontSize: 15.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w400 ),
                                                              child: Text('A banana is a long, curved fruit with a soft, yellow skin when ripe. It typically grows in clusters on large herbaceous plants belonging to the genus Musa in the family Musaceae. Bananas are one of the most popular fruits worldwide, known for their sweet flavor and creamy texture. They are rich in essential nutrients such as potassium, vitamin C, and vitamin B6. Bananas are often consumed raw, but they can also be used in cooking, baking, or blended into smoothies.A banana is a long, curved fruit with a soft, yellow skin when ripe. It typically grows in clusters on large herbaceous plants belonging to the genus Musa in the family Musaceae. Bananas are one of the most popular fruits worldwide, known for their sweet flavor and creamy texture. They are rich in essential nutrients such as potassium, vitamin C, and vitamin B6. Bananas are often consumed raw, but they can also be used in cooking, baking, or blended into smoothies.')),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bananas',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            'A banana is a long, curved fruit with a soft, yellow skin when ripe. It typically grows in clusters on large herbaceous plants belonging to the genus Musa in the family Musaceae. Bananas are one of the most popular fruits worldwide, known for their sweet flavor and creamy texture. They are rich in essential nutrients such as potassium, vitamin C, and vitamin B6. Bananas are often consumed raw, but they can also be used in cooking, baking, or blended into smoothies. Read more',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
          //TODO list 5 elements at a time and enable user to scroll vertically in this section
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
            flex: 5,
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
                                          onPressed: () {
                                            showCupertinoModalPopup(context: context, builder: (BuildContext context){
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 32.0),
                                                child: SizedBox(
                                                  height:SizeConfig.screenHeight,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          color: Colors.white
                                                      ),
                                                      height: 350,
                                                      width: 380,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(24.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                DefaultTextStyle(style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                    child: Text('LOW CARBS FOOD PLAN \nDETAILS')),
                                                                TextButton(onPressed: () { Navigator.pop(context); },
                                                                    child: Icon(Icons.close,color: Colors.red,)),
                                                              ],
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            ),
                                                            SizedBox(height: 20.0,),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                    child: Text('Overview')),
                                                                DefaultTextStyle(style: TextStyle(fontSize: 15.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w400 ),
                                                                    child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially')),
                                                              ],
                                                            ),
                                                            SizedBox(height: 20.0,),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                    child: Text('What you will do')),
                                                                DefaultTextStyle(style: TextStyle(fontSize: 15.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w400 ),
                                                                    child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially')),
                                                              ],
                                                            ),
                                                            SizedBox(height: 20.0,),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                DefaultTextStyle(style: TextStyle(fontSize: 18.0,color: AppColors.loginHintColor,fontFamily:'Inter',fontWeight: FontWeight.w900 ),
                                                                    child: Text('Guidelines')),
                                                                DefaultTextStyle(style: TextStyle(fontSize: 15.0,color: Colors.black,fontFamily:'Inter',fontWeight: FontWeight.w400 ),
                                                                    child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially')),
                                                              ],
                                                            ),
                                                            SizedBox(height: 20.0,),
                                                            SizedBox(
                                                              width: SizeConfig.screenWidth * .5,
                                                              height: 50,
                                                              child: FilledButton(
                                                                onPressed: () {
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(Icons.event_note_outlined,),
                                                                    SizedBox(width: 10.0,),
                                                                    Text(
                                                                      'Add to my plan',
                                                                      style: TextStyle(
                                                                          fontFamily: 'Inter',
                                                                          fontSize: 16,
                                                                          color: Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                                style: FilledButton.styleFrom(
                                                                    backgroundColor: AppColors.primaryColor,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8))),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ),
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
