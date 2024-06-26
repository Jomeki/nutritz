import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import '../../../Themes/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> Gender = ['Male', 'Female'];
  String dropval = "Choose Gender";

  var blood = ['O', 'A', 'B', 'AB'];
  String dropdownvalue = "Choose Blood Group";
  String dropdownvaluehealth = "Current health goal";
  String dropdownvalueactivity = "Current activity level";
  String dropdownvaluesleephours = "Current sleep hours";
  String dropdownvaluealchoholintake = "Current alchohol intake status";
  String dropdownvalueallergies = "Current allergy status";

  var healthgoal = [
    'Loose weight',
    'Eat Healthy',
    'Manage Stress',
    'Disease Prevention'
  ];
  var activitylevel = ['Not Active', 'Lightly Active', 'Active', 'Very Active'];
  var sleephours = [
    'Greater than 8 Hours',
    '7-8 Hours',
    '5-6 Hours',
    '4-3 Hours',
    'Less than 3 Hours'
  ];
  var alchoholintake = ['Yes', 'No'];
  var allergies = ['Yes', 'No'];

  String selectedMeasurement = 'cm';
  String selectedWeight = 'kg';

  List<String> measurement = ['cm', 'ft'];
  List<String> weight = ['kg', 'pnd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Update your profile details here to keep us informed about your health condition to help us make more accurate suggestions",
                      style: TextStyle(color: AppColors.loginHintColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0,),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Height',
                        suffixIcon: SizedBox(
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: PopupMenuButton(
                              initialValue: selectedMeasurement,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(selectedMeasurement),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: Text(measurement[0]),
                                    onTap: () {
                                      setState(() {
                                        selectedMeasurement = measurement[0];
                                      });
                                    }),
                                PopupMenuItem(
                                    child: Text(measurement[1]),
                                    onTap: () {
                                      setState(() {
                                        selectedMeasurement = measurement[1];
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.height,
                          color: AppColors.primaryColor,
                        ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0,),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Weight',
                        suffixIcon: SizedBox(
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: PopupMenuButton(
                              initialValue: selectedWeight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(selectedWeight),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text(weight[0]),
                                  onTap: () {
                                    setState(() {
                                      selectedWeight = weight[0];
                                    });
                                  },
                                ),
                                PopupMenuItem(
                                    child: Text(weight[1]),
                                    onTap: () {
                                      setState(() {
                                        selectedWeight = weight[1];
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(
                          Icons.balance,
                          color: AppColors.primaryColor,
                        ),
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Blood Group',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(CupertinoIcons.drop),
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
                      items: blood.map((e) {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Health Goal',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.health_and_safety),
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
                      items: healthgoal.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownvaluehealth = newvalue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Activity level',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.directions_walk),
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
                      items: activitylevel.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownvalueactivity = newvalue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Sleep Hours',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.bed),
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
                      items: sleephours.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownvaluesleephours = newvalue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Alchohol intake',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.local_drink),
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
                      items: alchoholintake.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownvaluealchoholintake = newvalue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Allergies',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.sick),
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
                      items: allergies.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownvalueallergies = newvalue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .5,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text(
                          'Save Details',
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
