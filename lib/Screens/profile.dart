import 'dart:core';
import 'dart:core';
import 'dart:typed_data';
import 'package:nutriapp/Screens/edit_profile.dart';

import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriapp/Providers/appState.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/utils.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  List<Map<String, String>> healthinfo = [
    {'label': 'Weight', 'data': '40Kg'},
    {'label': 'Height', 'data': '160Cm'},
    {'label': 'BMI', 'data': '30Kg/Cm'},
    {'label': 'Blood Group', 'data': 'A'},
    {'label': 'Gender', 'data': 'Male'},
    {'label': 'Sleep Hours', 'data': '<8 Hrs'},
    {'label': 'Allergies', 'data': 'No'},
    {'label': 'Alcohol', 'data': 'No'},
    {'label': 'Activity', 'data': 'Not Active'},
  ];

  List<Icon> icondata = [
    Icon(Icons.balance, color: AppColors.primaryColor),
    Icon(Icons.height, color: AppColors.primaryColor),
    Icon(Icons.balance, color: AppColors.primaryColor),
    Icon(Icons.bloodtype, color: AppColors.primaryColor),
    Icon(Icons.transgender, color: AppColors.primaryColor),
    Icon(Icons.timelapse_outlined, color: AppColors.primaryColor),
    Icon(Icons.sick, color: AppColors.primaryColor),
    Icon(Icons.local_drink, color: AppColors.primaryColor),
    Icon(Icons.directions_walk, color: AppColors.primaryColor)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg'),
                                  radius: 64,
                                ),
                          Positioned(
                            child: IconButton(
                              onPressed: selectImage,
                              icon: Icon(Icons.add_a_photo),
                            ),
                            bottom: -10,
                            left: 80,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "John Doe",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                      Text(
                        "+255 000 0000",
                        style: TextStyle(
                            color: AppColors.loginHintColor, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  Center(
                    child: Text(
                      "Health Goal",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: AppColors.loginBorderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      subtitle: Text(
                        'This nutritional goal aims at improving the quality of food intake',
                        style: TextStyle(color: AppColors.loginHintColor),
                      ),
                      title: Text(
                        'Eat Healthy',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Health information",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1.2),
                        itemCount: healthinfo.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    icondata[i],
                                    Text(
                                      healthinfo[i]['label'].toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      healthinfo[i]['data'].toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.loginHintColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: SizedBox(
                  //     height: 130,
                  //     width: 600,
                  //     //TODO Make the tile details three per row
                  //     child: ListView.builder(
                  //       itemCount: healthinfo.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, i) => Row(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 8.0, vertical: 8.0),
                  //             child: Container(
                  //               width: 110,
                  //               height: 110,
                  //               decoration: BoxDecoration(
                  //                 border: Border.all(color: AppColors.primaryColor),
                  //                 borderRadius: BorderRadius.circular(8.0),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   icondata[i],
                  //                   Text(
                  //                     healthinfo[i]['label'].toString(),
                  //                     style: TextStyle(
                  //                       fontSize: 15,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     healthinfo[i]['data'].toString(),
                  //                     style: TextStyle(
                  //                         fontSize: 20,
                  //                         color: AppColors.loginHintColor),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .5,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        child: Text(
                          'Edit profile details',
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .5,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
