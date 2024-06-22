import 'package:activity/ui/components/custom-text-form-field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../utils/R.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const String routName = "ForgetPassword";

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailTextEditingController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.forgetPassword,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
               AppLocalizations.of(context)!.titlePass,
              style: Theme.of(context).textTheme.titleMedium
            ),
            CustomTextFormField(
                labelText: AppLocalizations.of(context)!.hintEmail,
                controller: emailTextEditingController
            ),
            const SizedBox(height: 10),
            _isLoading
            ?CircularProgressIndicator(color: Colors.green,)
            :
            ElevatedButton(
              onPressed: () {
                passwordReset();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.resetPassword,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future passwordReset()async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailTextEditingController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(
              AppLocalizations.of(context)!.passwordResetLinkSent,
              style: Theme.of(context).textTheme.titleSmall
          ),
          title: Text(
              AppLocalizations.of(context)!.congratulation,
              style: Theme.of(context).textTheme.titleLarge
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  color: Colors.green,
                  width: 2
              ),
          ),
          backgroundColor: Theme.of(context).cardColor,
        );
      });
    }on FirebaseAuthException catch(e){
      if(emailTextEditingController.text.isEmpty){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(
              AppLocalizations.of(context)!.emptyValue,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            backgroundColor: Theme.of(context).cardColor,
          );
        });
      }else {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: Text(
                AppLocalizations.of(context)!.emailBadlyFormatted,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            title: Text(
                AppLocalizations.of(context)!.sorry,
                style: Theme.of(context).textTheme.titleLarge
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            backgroundColor: Theme.of(context).cardColor,
          );
        }
        );
      }
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }
}
