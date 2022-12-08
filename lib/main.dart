import 'package:alumni_hub/providers/authentication.dart';
import 'package:alumni_hub/firebase_options.dart';
import 'package:alumni_hub/providers/events.provider.dart';
import 'package:alumni_hub/views/splash.screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider<Authentication>(
            create: (context) => Authentication()),
        ChangeNotifierProvider<EventData>(create: (context) => EventData())
      ],
      child: MaterialApp(
          title: 'Alumni Hub',
          theme: ThemeData(
            primarySwatch: Colors.primaries[3],
          ),
          home: const SplashScreen()),
    );
  }
}
