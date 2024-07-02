import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nutriapp/Models/evaluations.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import 'package:provider/provider.dart';
import '../../../Themes/colors.dart';
import '../Models/goals.dart';
import '../Models/user.dart';
import '../Providers/goalsProvider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> Gender = ['Male', 'Female'];
  String dropval = "Choose Gender";

  TextEditingController heightcon = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  late GoalsProvider _goalsProvider;
  List<Goals> _goals = [];
  final _formKey = GlobalKey<FormState>();

  late AuthProvider _authProvider;

  late LocalStorageProvider _storageProvider;

  var blood = ['O', 'A', 'B', 'AB'];
  String? selectedBloodGroup;
  Goals? _selectedGoal;
  String? selectedActivityLevel;
  String? selectedSleepHours;
  String? selectedAlcoholIntake;
  String? selectedAlergies;

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
  var alchoholintake = ['YES', 'NO'];
  var allergies = ['YES', 'NO'];

  String selectedMeasurement = 'cm';
  String selectedWeight = 'kg';

  User? _user;

  List<String> measurement = ['cm', 'ft'];
  List<String> weight = ['kg', 'pnd'];

  @override
  void initState() {
    _storageProvider =
        Provider.of<LocalStorageProvider>(context, listen: false);
    _user = _storageProvider.user;
    try {
      _user = _storageProvider.user;
      if (_user!.height != null) {
        heightcon = TextEditingController(text: _user!.height.toString());
      }

      if (_user!.weight != null) {
        weightcon = TextEditingController(text: _user!.weight.toString());
      }

      if (_user!.blood_group != null) {
        selectedBloodGroup = _user!.blood_group.toString();
      }

      if (_user!.ngoal_id != null) {
        _selectedGoal = Provider.of<GoalsProvider>(context, listen: false)
            .goals
            .firstWhere((element) =>
                element.id.toString() == _user!.ngoal_id.toString());
      }

      if (_user!.evaluation != null) {
        selectedActivityLevel = _user!.evaluation!.activity_level.toString();
        selectedSleepHours = _user!.evaluation!.sleep_hours.toString();
        selectedAlcoholIntake = _user!.evaluation!.alcohol_intake.toString();
        selectedAlergies = _user!.evaluation!.allergies.toString();
      }
    } catch (e) {}
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _storageProvider = Provider.of<LocalStorageProvider>(context);
    _authProvider = Provider.of<AuthProvider>(context);
    _goalsProvider = Provider.of<GoalsProvider>(context);
    _goals = _goalsProvider.goals;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Update your profile details here to keep us informed about your health condition to help us make more accurate suggestions",
                        style: TextStyle(color: AppColors.loginHintColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        controller: heightcon,
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
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        controller: weightcon,
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
                        value: selectedBloodGroup,
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
                            selectedBloodGroup = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField<Goals>(
                        value: _selectedGoal,
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
                        items: _goals.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          );
                        }).toList(),
                        onChanged: (Goals? newvalue) {
                          setState(() {
                            _selectedGoal = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField(
                        value: selectedActivityLevel,
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
                            selectedActivityLevel = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField(
                        value: selectedSleepHours,
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
                            selectedSleepHours = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField(
                        value: selectedAlcoholIntake,
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
                            selectedAlcoholIntake = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField(
                        value: selectedAlergies,
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
                            selectedAlergies = newvalue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: SizedBox(
                        width: SizeConfig.screenWidth * .5,
                        height: 50,
                        child: FilledButton(
                          onPressed: _updateProfile,
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
      ),
    );
  }

  _updateProfile() async {
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
                  "Updating Profile",
                  style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontFamily: 'Inter'),
                ),
              ],
            ));
    if (_formKey.currentState!.validate()) {
     try{
       await Future.wait([
         _authProvider.updateEvaluation(evaluation: Evaluations(
           id: _user?.evaluation?.id,
             alcohol_intake: selectedAlcoholIntake,
             sleep_hours: selectedSleepHours,
             activity_level: selectedActivityLevel,
             allergies: selectedAlergies,
             allergy_description: null,
             user_id: _user?.id,
             ngoal_id: _selectedGoal?.id
         )),
         _authProvider.updateUser(user: User(
             weight: weightcon.text.toString(),
             height: heightcon.text.toString(),
             blood_group: selectedBloodGroup,
             ngoal_id: _selectedGoal?.id
         ))
       ]);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           behavior: SnackBarBehavior.floating,
           margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8)),
           content: Text("Update Successfull",style: TextStyle(color: Colors.white),),
           backgroundColor: AppColors.primaryColor,));
     }catch(e){
     }
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
