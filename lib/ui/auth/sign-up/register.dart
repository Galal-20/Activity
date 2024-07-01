
import 'package:activity/ui/auth/store_user_data/model/users.dart';
import 'package:activity/ui/components/custom-text-form-field.dart';
import 'package:activity/ui/home/homeScreen.dart';
import 'package:activity/utils/email-validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



import '../../../utils/R.dart';
import '../login/login.dart';
import '../store_user_data/user_dao.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key,});
  static const String routName = "/Register";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  var formKey= GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
            Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 8,
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.green
                      )
                  ),
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.signUpText,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextFormField(
                            labelText: AppLocalizations.of(context)!.fullName,
                            keyboardType: TextInputType.text,
                            controller: fullNameController,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return AppLocalizations.of(context)!.enterValidFullName;
                              }
                              if(input.length<5){
                                return AppLocalizations.of(context)!.notValidFullName;
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            labelText: AppLocalizations.of(context)!.userName,
                            keyboardType: TextInputType.text,
                            controller:  userNameController,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return AppLocalizations.of(context)!.enterValidUserName;
                              }
                              if(input.length<3){
                                return AppLocalizations.of(context)!.notValidUserName;
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            labelText: AppLocalizations.of(context)!.hintEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller:  emailController,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return AppLocalizations.of(context)!.enterValidEmail;
                              }
                              if(input.length<5){
                                return AppLocalizations.of(context)!.notValidEmail;
                              }
                              if(!isValidEmail(input)){
                                return AppLocalizations.of(context)!.emailNotMatch;
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            labelText: AppLocalizations.of(context)!.hintPassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller:  passwordController,
                            isObSecure: true,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return AppLocalizations.of(context)!.enterValidPassword;
                              }
                              if(input.length<3){
                                return AppLocalizations.of(context)!.notValidPassword;
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            labelText: AppLocalizations.of(context)!.hintConfirmPass,
                            keyboardType: TextInputType.visiblePassword,
                            controller: confirmPasswordController,
                            isObSecure: true,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return AppLocalizations.of(context)!.enterValidConfirmPassword;
                              }
                              if(input.length<3){
                                return AppLocalizations.of(context)!.notValidConfirmPassword;
                              }
                              if(input != passwordController.text){

                                return AppLocalizations.of(context)!.passwordNotMatching;

                              }
                              return null;
                            },
                          ),
                          _isLoading
                          ? const CircularProgressIndicator(color: Colors.green,)
                          :
                          ElevatedButton(
                            onPressed: () {
                             /* Fluttertoast.showToast(
                                  msg: "Sign up success",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Check your inputs'),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                );
                              */
                              singUp();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.signUpButtonText,
                              style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Text.rich(
                            TextSpan(
                              text: AppLocalizations.of(context)!.doYouHaveAnAccount,
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!.login,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =(){
                                    // navigates to login screen.
                                      singUp();
                                      Navigator.pushReplacementNamed(context, LoginScreen.routName);
                                    },
                                  style: const TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.green
                                  )
                                )
                              ]
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }


  singUp() async{
    if(!(formKey.currentState!.validate())) return;
    setState(() {_isLoading = true;});
    try {
        var  userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Users users = Users(
            id: userCredential.user?.uid,
          fullName: fullNameController.text,
          userName: userNameController.text,
          email: emailController.text
        );
        await UserDao.addUser(users);

      Fluttertoast.showToast(
          msg: "${AppLocalizations.of(context)!.signUpSuccess} ${users.userName}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    }on FirebaseAuthException catch(e){
      if (e.code == R.weakPassword) {
        print('The password provided is too weak.');
      } else if (e.code == R.emailAlreadyInUse) {
        print('The account already exists for that email.');
      }
    }catch(e){
      print(e.toString());
    }finally{
      setState(() {_isLoading = false;});
    }

  }

}
