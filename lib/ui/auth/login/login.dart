import 'package:activity/ui/auth/forgetPassword/forgetPasswordScreen.dart';
import 'package:activity/ui/auth/sign-up/register.dart';
import 'package:activity/ui/auth/store_user_data/user_dao.dart';
import 'package:activity/ui/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/R.dart';
import '../../../utils/email-validation.dart';
import '../../components/custom-text-form-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routName = "/Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


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
                          ? const CircularProgressIndicator(color: Colors.green,)
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: "bt1",
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            onPressed: () async {
                              User? user = await signInWithGoogle();
                                Navigator.pushReplacementNamed(
                                    context,
                                    HomeScreen.routName);

                            },
                            child: Image.asset("assets/images/google.png"),
                          ),
                          const SizedBox(width: 20,),
                          FloatingActionButton(
                            heroTag: "bt2",
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            onPressed: (){},
                            child: Image.asset("assets/images/facebook.png"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
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
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      var user = await UserDao.getUsers(userCredential.user!.uid);

      Fluttertoast.showToast(
          msg: "${AppLocalizations.of(context)!.signInSuccess} ${user?.userName}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    } on FirebaseAuthException catch (e) {
      if (e.code == R.userNotFound) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No user found for that email.'),
            backgroundColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        );
      } else if (e.code == R.wrongPassword) {
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


  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  /*Future<void> sendEmailVerificationLink()async{
    try{
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    }catch(e){
      print(e.toString());
    }

  }*/
}
