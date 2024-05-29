import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Providers/foodsProvider.dart';
import 'package:nutriapp/Providers/planProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Screens/Auth/login.dart';
import 'package:nutriapp/Screens/Intro/onboarding.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/storage.dart';
import 'package:provider/provider.dart';
import 'Providers/appState.dart';
import 'Providers/goalsProvider.dart';

final _goalsProvider  = GoalsProvider();
final _plansProvider  = PlansProvider();
final _foodsProvider  = FoodsProvider();
final _storageProvider  = LocalStorageProvider();

Widget? _landingPage;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Future.wait([
    _plansProvider.getPlans(),
  _goalsProvider.getGoals(),
    _foodsProvider.getFoods(),
    _storageProvider.initialize()
  ]);



  if(!await LocalStorage.getOnboarding()){
    _landingPage= const OnboardingScreen();
  }else{
    if(await LocalStorage.checkSession()){
      _landingPage=const Home();
    }else{
      _landingPage =  const LoginScreen();
    }
  }

  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>AppState()),
    ChangeNotifierProvider(create: (context)=>AuthProvider()),
    ChangeNotifierProvider.value(value: _goalsProvider),
    ChangeNotifierProvider.value(value: _plansProvider),
    ChangeNotifierProvider.value(value: _foodsProvider),
    ChangeNotifierProvider.value(value: _storageProvider),
  ],child: const NutriTZ(),));
}


class NutriTZ extends StatelessWidget {
  const NutriTZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutri TZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          surfaceTintColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: _landingPage!,
    );
  }
}

