import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Models/evaluations.dart';
import 'package:nutriapp/Providers/evaluationProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Screens/Main/evaluation_two.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';

class EvaluationQuestionOne extends StatefulWidget {
  const EvaluationQuestionOne({super.key});

  @override
  State<EvaluationQuestionOne> createState() => _EvaluationQuestionOneState();
}

class _EvaluationQuestionOneState extends State<EvaluationQuestionOne> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
  int _selectedValue = 0;

  String? selectedOption;
  bool option = false;

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
              height: 90.0,
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
                    child: Text('Do you drink alchohol?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RadioListTile(
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                        title: Text("Yes"),
                        subtitle: Text("I drink alchohol on a regular basis"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: AppColors.loginBorderColor),
                            borderRadius: BorderRadius.circular(8)),
                        selectedTileColor: AppColors.primaryColor,
                      )),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RadioListTile(
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                        title: Text("No"),
                        subtitle: Text("I don't drink alchohol"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: AppColors.loginBorderColor),
                            borderRadius: BorderRadius.circular(8)),
                        selectedTileColor: AppColors.primaryColor,
                      )),
                  SizedBox(
                    height: 330.0,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .5,
                    height: 50,
                    child: FilledButton(
                      onPressed:_saveEvaluation,
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
          ],
        ),
      ),
    );
  }

  Future _saveEvaluation() async {
    if (_selectedValue != 0) {

      _evaluationProvider.evaluation=Evaluations(
        alcohol_intake: _selectedValue==1?"YES":"NO"
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EvaluationQuestionTwo()));


    }
  }
}
