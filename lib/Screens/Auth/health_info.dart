import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Screens/Auth/health_goal.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Services/validator.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';

class HealthInfoScreen extends StatefulWidget {
  const HealthInfoScreen({super.key});

  @override
  State<HealthInfoScreen> createState() => _HealthInfoScreenState();
}

class _HealthInfoScreenState extends State<HealthInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = "Choose blood group";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  var blood = ['O', 'A', 'B', 'AB'];

  String selectedMeasurement = 'cm';
  String selectedWeight = 'kg';

  List<String> measurement = ['cm', 'ft'];
  List<String> weight = ['kg', 'pnd'];

  late AuthProvider authProvider;

  @override
  void didChangeDependencies() {
    authProvider = Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .1,
            ),
            Text('Health information',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter')),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: TextFormField(
                      controller: heightController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (height) => height != null
                          ? (InputValidators.numberValidator(height, 'Height'))
                          : null,
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
                        vertical: 8.0, horizontal: 16),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: weightController,
                      validator: (weight) => weight != null
                          ? InputValidators.numberValidator(weight, "Weight")
                          : null,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    //TODO Implement validation for this dropdown
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: _saveRegistrationData,
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
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .2,
            ),
          ],
        ),
      ),
    );
  }
  double calculteBMI(){
    var height = heightController.value;
    var weight = weightController.value;

    var bmi = ((int.parse(weight.text.toString())/pow(int.parse(height.text.toString())/100,2)));

    return bmi;
  }


  Future _saveRegistrationData() async {
    if (_formKey.currentState!.validate()) {
      if (heightController.text.isNotEmpty &&
              weightController.text.isNotEmpty &&
              dropdownvalue.toString() == "O" ||
          dropdownvalue.toString() == "A" ||
          dropdownvalue.toString() == "B" ||
          dropdownvalue.toString() == "AB") {
        authProvider.registrationUser!.height = heightController.text;
        authProvider.registrationUser!.weight = weightController.text;
        authProvider.registrationUser!.blood_group = dropdownvalue;
        authProvider.registrationUser!.bmi =calculteBMI().toStringAsFixed(3);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HealthGoalScreen()));
      }
    }
  }
}
