import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Auth/forget.dart';
import 'package:nutriapp/Screens/Auth/registration.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Services/validator.dart';
import 'package:nutriapp/Themes/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginDetailsController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validNumber(String input) {
    RegExp regex = RegExp(r'^(07|06)\d{8}$');
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                      controller: _loginDetailsController,
                      validator: (username) => ((username) != null) ?  InputValidators.validNumber(username):null,
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
                      controller: _passwordController,
                      validator: (pass) => (pass != null)?InputValidators.passValidator(pass):null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Passsword',
                        prefixIconColor: AppColors.primaryColor,
                        prefixIcon: Icon(
                          CupertinoIcons.padlock_solid,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        try{
                          if(_formKey.currentState!.validate()){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                                (route) => false);
                          }

                        }catch(e){
                            const AlertDialog(
                              title: Text("Failed to validate user credentials"),
                            );
                        }
                      },
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPasswordScreen()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.loginHintColor,
                            fontSize: 16),
                      ),
                    ),
                  )
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
}
