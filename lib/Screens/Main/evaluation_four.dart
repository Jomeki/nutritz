import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';
import '../../Providers/evaluationProvider.dart';
import '../../Providers/storageProvider.dart';
import '../home.dart';

class EvaluationQuestionFour extends StatefulWidget {
  const EvaluationQuestionFour({super.key});

  @override
  State<EvaluationQuestionFour> createState() => _EvaluationQuestionFourState();
}

class _EvaluationQuestionFourState extends State<EvaluationQuestionFour> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
  int selectedIndex = -1;
  List<Map<String, String>> options = [
    {
      'title': 'Not Active',
      'description': 'Spends most of the day sitting (e.g Desk job)'
    },
    {
      'title': 'Lightly Active',
      'description': 'Spends most of the day on your feet (e.g Teacher)'
    },
    {
      'title': 'Active',
      'description':
          'Spends most of the day doing physical activity (e.g  Postal carrier)'
    },
    {
      'title': 'Very Active',
      'description':
          'Spends most of the doing heavy physical activity(e.g Carpenter)'
    },
  ];

  late User _user;
  late LocalStorageProvider _storageProvider;
  late EvaluationProvider _evaluationProvider;

  @override
  void didChangeDependencies() {
    _evaluationProvider = Provider.of<EvaluationProvider>(context);
    _storageProvider = Provider.of<LocalStorageProvider>(context);
    _user = _storageProvider.user!;
    super.didChangeDependencies();
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
          children: [
            SizedBox(
              height: 80.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text('What is your activity level?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter')),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: CheckboxListTile(
                            title: Text(options[index]['title']!),
                            subtitle: Text(options[index]['description']!),
                            value: selectedIndex ==
                                index, // Check if current option is selected
                            onChanged: (bool? value) => setState(
                                () => selectedIndex = value! ? index : -1),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.loginBorderColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            activeColor: AppColors.primaryColor,
                            checkColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed: _completeEvaluation,
                      child: Text(
                        'Finish evaluation',
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
          ],
        ),
      ),
    );
  }

  Future _completeEvaluation() async {

    if (selectedIndex != -1) {
      _evaluationProvider.evaluation!.activity_level = options[selectedIndex]['title'];
      _evaluationProvider.evaluation!.user_id = _user.id;
      _evaluationProvider.evaluation!.ngoal_id = _user.ngoal_id;

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
                    "Evaluating",
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontFamily: 'Inter'),
                  ),
                ],
              ));

      await _evaluationProvider.addEvaluation();
      await Provider.of<LocalStorageProvider>(context, listen: false)
          .initialize();
      Navigator.pop(context);
      if (_evaluationProvider.isEvaluated) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  height: 280,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsLoader.success,
                        width: 120,
                        height: 120,
                        scale: 2,
                      ),
                      Text(
                        'Evaluation Complete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              );
            });
        Future.delayed(Duration(seconds: 2), () async {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false);
        });
      }
    }
  }
}
