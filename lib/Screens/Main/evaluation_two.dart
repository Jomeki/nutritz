import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/Screens/Main/evaluation_three.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';
import '../../Providers/evaluationProvider.dart';
import '../../Providers/storageProvider.dart';

class EvaluationQuestionTwo extends StatefulWidget {
  const EvaluationQuestionTwo({super.key});

  @override
  State<EvaluationQuestionTwo> createState() => _EvaluationQuestionTwoState();
}

class _EvaluationQuestionTwoState extends State<EvaluationQuestionTwo> {
  final _formKey = GlobalKey<FormState>();
  bool isChanged = true;
  int selectedIndex = -1;
  List<String> options = ['Greater than 8 Hours', '7-8 Hours', '5-6 Hours', '4-3 Hours', 'Less than 3 Hours'];

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
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                    child: Text('What are your current sleeping hours?',textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter')),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.5,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: CheckboxListTile(
                            title: Text(options[index]),
                            value: selectedIndex == index, // Check if current option is selected
                            onChanged: (bool? value) => setState(() => selectedIndex = value! ? index : -1),
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
    if (selectedIndex != -1) {
      _evaluationProvider.evaluation!.sleep_hours=options[selectedIndex];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EvaluationQuestionThree()));
    }
  }


}
