import 'package:activity/ui/auth/forgetPassword/forgetPasswordScreen.dart';
import 'package:activity/ui/auth/sign-up/register.dart';
import 'package:activity/ui/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/email-validation.dart';
import '../../components/custom-text-form-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routName = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
          Center(
            child: Card(
              elevation: 8,
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(width: 3, color: Colors.green)),
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Text(
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        labelText: AppLocalizations.of(context)!.hintEmail,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validEmail;
                          }
                          if (input.length < 5) {
                            return AppLocalizations.of(context)!.notValidEmail;
                          }
                          if (!isValidEmail(input)) {
                            return AppLocalizations.of(context)!.emailNotMatch;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: AppLocalizations.of(context)!.hintPassword,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        isObSecure: true,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return AppLocalizations.of(context)!.enterValidPassword;
                          }
                          if (input.length < 3) {
                            return AppLocalizations.of(context)!.notValidPassword;
                          }
                          return null;
                        },
                      ),
                      Text.rich(
                          textAlign: TextAlign.end,
                          TextSpan(
                              text: AppLocalizations.of(context)!.forgetPassword,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPassword()));
                                  //forgetPassword();
                                },
                              style: const TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.green))),
                      const SizedBox(height: 10),
                      _isLoading
                          ? CircularProgressIndicator(color: Colors.green,)
                          :
                      ElevatedButton(
                        onPressed: () {
                          singIn();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 48, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                          TextSpan(
                              text: AppLocalizations.of(context)!.createAnAccount,
                              children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.signUpText,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, SignUpScreen.routName);
                              },
                            style: const TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green))
                      ]))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> singIn() async {
    if (!(formKey.currentState!.validate())) {
      return;
    }
    setState(() {
      _isLoading = true; // Show loading indicator
    });
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.signInSuccess,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
      /*StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      );*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No user found for that email.'),
            backgroundColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Wrong email or password'),
            backgroundColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.toString()} or Wrong email or password'),
          backgroundColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

}
