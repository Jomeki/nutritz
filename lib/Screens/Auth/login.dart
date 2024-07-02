import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:nutriapp/Models/user.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Providers/enrollementProvider.dart';
import 'package:nutriapp/Providers/goalsProvider.dart';
import 'package:nutriapp/Providers/goalsfoodProvider.dart';
import 'package:nutriapp/Providers/goalsplanProvider.dart';
import 'package:nutriapp/Providers/progressProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Screens/Auth/forget.dart';
import 'package:nutriapp/Screens/Auth/registration.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Services/validator.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Providers/evaluationProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  late AuthProvider authProvider;

  bool _validNumber(String input) {
    RegExp regex = RegExp(r'^(07|06)\d{8}$');
    return regex.hasMatch(input);
  }

  bool _hidePass = true;

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
                      controller: _phone,
                      validator: (username) => ((username) != null)
                          ? InputValidators.validNumber(username)
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: Icon(
                          CupertinoIcons.phone_fill,
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
                      controller: _password,
                      validator: (pass) => (pass != null)
                          ? InputValidators.passValidator(pass)
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: _login,
                      child: Text(
                        'Login',
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   const ForgetPasswordScreen()));
                  //     },
                  //     child: Text(
                  //       'Forgot Password?',
                  //       style: TextStyle(
                  //           fontFamily: 'Inter',
                  //           color: AppColors.loginHintColor,
                  //           fontSize: 16),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .2,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? \t',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Text('Sign up',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _login() async {
    if (_formKey.currentState!.validate()) {
      if (_phone.text.isNotEmpty && _password.text.isNotEmpty) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: AppColors.primaryColor,
                      size: 100.0,
                    ),
                    Text(
                      "Logging In",
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ));
        Map number = await parse(_phone.text.toString(), region: "TZ");
        await authProvider.login(
            user: User(
                phone_number:
                    number['e164'].toString().split("+")[1].toString(),
                password: _password.text));

        if (authProvider.isLoggedIn) {
         await Provider.of<LocalStorageProvider>(context, listen: false)
              .initialize();
           Future.wait([
            Provider.of<GoalsFoodProvider>(context, listen: false)
              .getGoalsFood(),
            Provider.of<GoalsPlanProvider>(context, listen: false)
                .initialize(),
             Provider.of<EvaluationProvider>(context, listen: false)
                 .initialize(),
            Provider.of<GoalsProvider>(context, listen: false)
                .getGoals(),
            Provider.of<ProgressProvider>(context, listen: false)
                .getProgress()
          ]);

          Navigator.pop(context);

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false);
        } else {
          if (authProvider.responseTime >= 5000) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Network Issues"),
                content: SelectableText(
                    "Please check your network connection and try to login again"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          } else {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Invalid Credentials"),
                content: SelectableText(
                    "Please check your credentials and try to login again"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          }
        }
      }
    }
  }
}
