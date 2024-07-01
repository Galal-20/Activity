import 'package:activity/ui/home/Settings_tab/settings_tab.dart';
import 'package:activity/ui/home/Taskes_list/taskes_list.dart';
import 'package:activity/ui/home/task_buttom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../auth/login/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          //"Welcome ${user.email}",
          AppLocalizations.of(context)!.titleBar,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: const Icon(Icons.logout),
            color: Colors.red,
            iconSize: 25,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(width: 4, color: Colors.white)),
        onPressed: () {
          addTask();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectIndex],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        height: MediaQuery.of(context).size.height * 0.11,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectIndex,
          onTap: (index) {
            selectIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: AppLocalizations.of(context)!.tasksBar
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settingsBar
            )
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [const TaskesList(), SettingsTab()];

  void addTask() {
    showModalBottomSheet(
        context: context,
        builder: (context) => const TaskBottomSheet(),
        backgroundColor: Theme.of(context).cardColor);
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.signOutSuccess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushReplacementNamed(context, LoginScreen.routName);
  }
}
