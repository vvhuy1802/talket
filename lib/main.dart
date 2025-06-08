import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talket/presentation/module/splash/splash_screen.dart';
import 'package:talket/presentation/navigation/routes.dart';

void main() async {
  // init di
  // await init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      title: "Talket",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: generateRoute,
    );
  }
}
