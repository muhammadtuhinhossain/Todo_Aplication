import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_router.dart';
import 'package:todo_app/model/provider_model.dart';

import 'screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(ChangeNotifierProvider(
      create: (BuildContext context)=> ProviderModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        brightness: Brightness.dark
      ),

      initialRoute: HomeScreen.name,
      routes: AppRouter.routes,
    );
  }
}

