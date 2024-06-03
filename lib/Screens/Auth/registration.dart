import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Services/validator.dart';
import 'package:provider/provider.dart';
import '../../Models/user.dart';
import 'health_info.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';

import 'otp.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = "Choose Gender";
  var Gender = ['Male', 'Female'];
  TextEditingController dateController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController snameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  DateTime? picker;
  late AuthProvider authProvider;
  bool _hidePass = true;

  Future<void> selectDate() async {
    picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());

    if (picker != null) {
      setState(() {
        dateController.text = picker.toString().split(" ")[0];
      });
    }
  }

  @override
  void didChangeDependencies() {
    authProvider = Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Text('Personal Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter')),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: TextFormField(
                          controller: fnameController,
                          validator: (fname) => (fname != null)
                              ? InputValidators.textFieldValidator(
                                  fname, 'First name')
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'First name',
                            prefixIcon: Icon(
                              CupertinoIcons.person,
                              color: AppColors.primaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: snameController,
                          validator: (sname) => (sname != null)
                              ? InputValidators.textFieldValidator(
                                  sname, "Second name")
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Second name',
                            prefixIcon: Icon(
                              CupertinoIcons.person,
                              color: AppColors.primaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phoneController,
                          validator: (phone) => (phone != null)
                              ? (InputValidators.validNumber(phone))
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            prefixIcon: Icon(
                              CupertinoIcons.phone,
                              color: AppColors.primaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passController,
                          validator: (pass) => pass != null
                              ? InputValidators.passValidator(pass)
                              : null,
                          obscureText: _hidePass,
                          decoration: InputDecoration(
                            hintText: 'Passsword',
                            prefixIconColor: AppColors.primaryColor,
                            prefixIcon: Icon(
                              CupertinoIcons.padlock_solid,
                              color: AppColors.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _hidePass
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _hidePass = !_hidePass;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: DropdownButtonFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (gender) => (gender != null)
                              ? null
                              : 'Field cannot be empty, Please select Gender',
                          //TODO: Not yet implemented validation for dropdown input
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            prefixIconColor: AppColors.primaryColor,
                            prefixIcon: Icon(CupertinoIcons.person_2_alt),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
                          items: Gender.map((e) {
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
                      //TODO Validator on date picker
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: TextFormField(
                          controller: dateController,
                          readOnly: true,
                          onTap: () {
                            selectDate();
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Date of Birth',
                            prefixIconColor: AppColors.primaryColor,
                            prefixIcon: Icon(
                              CupertinoIcons.calendar,
                              color: AppColors.primaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.loginBorderColor)),
                          ),
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
                            'Submit',
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _saveRegistrationData() async {
    if (_formKey.currentState!.validate()) {
      if (phoneController.text.isNotEmpty &&
              passController.text.isNotEmpty &&
              fnameController.text.isNotEmpty &&
              snameController.text.isNotEmpty &&
              dateController.text.isNotEmpty &&
              dropdownvalue.toString() == "Male" ||
          dropdownvalue.toString() == "Female") {
        Map number = await parse(phoneController.text.toString(), region: "TZ");
        authProvider.registrationUser = User(
          fname: fnameController.text,
          sname: snameController.text,
          gender: dropdownvalue,
          dob: dateController.text,
          phone_number: number['e164'].toString().split("+")[1].toString(),
          password: passController.text,
          password_confirmation: passController.text,
        );

        showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: AppColors.primaryColor,
                      size: 100.0,
                    ),
                    Text(
                      "Verifying Phone Number",
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontFamily: 'Inter'),
                    )
                  ],
                ));
        await authProvider.requestOTP(
            phoneNumber: number['e164'].toString().split("+")[1].toString(),
            registration: true);
        Navigator.pop(context);
        if (authProvider.otpSent) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OtpScreen()));
        } else {
          if (authProvider.responseMessage != null) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Verification Failed"),
                      content: (authProvider.responseMessage != null)
                          ? (SelectableText(authProvider.responseMessage))
                          : (SelectableText(
                              "We have Trouble creating your account, Check your network connection and Try again later")),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"))
                      ],
                    ));
          }
        }
      }
    }
  }
}
