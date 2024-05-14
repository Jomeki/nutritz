import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Screens/Intro/onboarding.dart';
import 'package:provider/provider.dart';
import 'Providers/appState.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>AppState()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

