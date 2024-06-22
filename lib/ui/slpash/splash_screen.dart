import 'package:activity/ui/auth/login/login.dart';
import 'package:activity/ui/auth/sign-up/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routName = "SplashScreen";

  @override
  /*void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            (){
      Navigator.pushReplacementNamed(context, LoginScreen.routName);
            }
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/background.jpg", fit: BoxFit.cover,),
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 200)),
              Center(
                child:
                Image.asset("assets/images/activities.png",width: 300,),
              ),
              const Padding(padding: EdgeInsets.only(top: 140)),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(
                      context,
                    LoginScreen.routName
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 4)
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.login,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 200),),
                        const Icon(
                          Icons.arrow_circle_right,
                          size: 50,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(
                      context,
                    SignUpScreen.routName
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 4)
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.signUpText,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 179),),
                        const Icon(
                          Icons.arrow_circle_right,
                          size: 50,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
