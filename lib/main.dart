import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Providers/authProvider.dart';
import 'package:nutriapp/Providers/evaluationProvider.dart';
import 'package:nutriapp/Providers/goalsplanProvider.dart';
import 'package:nutriapp/Providers/progressProvider.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Screens/Auth/login.dart';
import 'package:nutriapp/Screens/Intro/onboarding.dart';
import 'package:nutriapp/Screens/home.dart';
import 'package:nutriapp/Services/Firebase/firebase_api.dart';
import 'package:nutriapp/Services/storage.dart';
import 'package:provider/provider.dart';
import 'Providers/appState.dart';
import 'Providers/goalsProvider.dart';
import 'Providers/goalsfoodProvider.dart';
import 'Services/Firebase/firebase_options.dart';

// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   if (kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//     print("Handling a background Title: ${message.notification?.title}");
//     print("Handling a background Title: ${message.notification?.body}");
//   }
// }

final _goalsProvider = GoalsProvider();
final _plansProvider = GoalsPlanProvider();
final _foodsProvider = GoalsFoodProvider();
final _evaluationProvider = EvaluationProvider();
final _progressProvider = ProgressProvider();
// final _enrolProvider = EnrollementProvider();
final _storageProvider = LocalStorageProvider();
final _firebase = FirebaseApi();

Widget? _landingPage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    dotenv.load(fileName: ".env"),
    if (Platform.isAndroid)
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      )
  ]);

  try {
    await Future.wait(
        [_storageProvider.initialize(), _firebase.initNotifications()]);
  } catch (e) {
    await _storageProvider.initialize();
  }

  // try {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // } catch (e) {}

  if (!await LocalStorage.getOnboarding()) {
    Future.wait([
      _goalsProvider.getGoals(),
    ]);
    _landingPage = const OnboardingScreen();
  } else {
    if (await LocalStorage.checkSession()) {
      Future.wait([
        _plansProvider.initialize(),
        _goalsProvider.getGoals(),
        _foodsProvider.getGoalsFood(),
        _progressProvider.getProgress(),
        _evaluationProvider.initialize(),
      ]);
      _landingPage = const Home();
    } else {
      Future.wait([
        _goalsProvider.getGoals(),
        _foodsProvider.getGoalsFood(),
      ]);
      _landingPage = const LoginScreen();
    }
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppState()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider.value(value: _goalsProvider),
      ChangeNotifierProvider.value(value: _plansProvider),
      ChangeNotifierProvider.value(value: _foodsProvider),
      ChangeNotifierProvider.value(value: _evaluationProvider),
      ChangeNotifierProvider.value(value: _storageProvider),
      ChangeNotifierProvider.value(value: _progressProvider),
      ChangeNotifierProvider.value(value: _firebase),
    ],
    child: const NutriTZ(),
  ));
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
