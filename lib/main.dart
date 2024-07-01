import 'package:activity/provider/settings-provider.dart';
import 'package:activity/style/my-theme.dart';
import 'package:activity/ui/auth/AuthWrapper.dart';
import 'package:activity/ui/auth/forgetPassword/forgetPasswordScreen.dart';
import 'package:activity/ui/auth/login/login.dart';
import 'package:activity/ui/auth/sign-up/register.dart';
import 'package:activity/ui/home/homeScreen.dart';
import 'package:activity/ui/slpash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'utils/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: Provider.of<SettingsProvider>(context).locale,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: Provider.of<SettingsProvider>(context).themeMode,
        home: AuthWrapper(),
        routes: {
          SignUpScreen.routName: (context) => const SignUpScreen(),
          LoginScreen.routName: (context)=> const LoginScreen(),
          HomeScreen.routName: (context) => const HomeScreen(),
          SplashScreen.routName:(context) => const SplashScreen(),
          ForgetPassword.routName:(context) => const ForgetPassword(),
        },

      );
  }
}

