import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/app/routes.dart';
import 'package:maideaze/ui/styles/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.onGenerateRouted,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor),
        useMaterial3: false,
      ),
    );
  }
}
