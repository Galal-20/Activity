import 'package:activity/provider/settings-provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  User user = FirebaseAuth.instance.currentUser!;


  List<String> docId = [];
  //final List<String> languages = ['English', 'Spanish', 'French', 'German'];
  final List<String> modes = ['Light', 'Dark', 'System'];
  String? currentMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeMode = Provider.of<SettingsProvider>(context).themeMode;
    if (themeMode == ThemeMode.light) {
      currentMode = 'Light';
    } else if (themeMode == ThemeMode.dark) {
      currentMode = 'Dark';
    } else {
      currentMode = 'System';
    }
  }

  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach(
                (element){
              print(element.reference);
              docId.add(element.reference.id);
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /* Text(
            'Account Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot){
                return ListView.builder(
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: GetUsersData(docID: docId[index],),
                          titleTextStyle: Theme.of(context).textTheme.titleSmall,
                          //textColor: Colors.black,
                          //tileColor: Colors.red,
                      ),
                    );
                  },
                  itemCount: docId.length,
                );
              },
            ),
          ),*/
          const SizedBox(height: 16.0),
          Text(
            AppLocalizations.of(context)?.lang?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8.0),
          DropdownButtonFormField<Locale>(
            value: Provider.of<SettingsProvider>(context, listen: false).locale,
            icon: const Icon(Icons.language),
            borderRadius: BorderRadius.circular(40),
            dropdownColor: Theme.of(context).cardColor,
            items:
                L10n.all.map((local){
                  final languageName = L10n.getLanguageName(local.languageCode);
                  return DropdownMenuItem<Locale>(
                    value: local,
                    child: Text(languageName),
                  );
                }).toList(),
            onChanged: (Locale? locale) {
              if(locale != null){
                Provider.of<SettingsProvider>(context, listen: false).setLocale
                  (locale);
              }
            },
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.lang,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(width: 2, color: Colors.white)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2,color: Colors.grey),
                  borderRadius: BorderRadius.circular(40)
              ),
            ),
          ),
          const SizedBox(height: 24.0),
           Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.titleSmall              ,
          ),
          const SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: currentMode,
            icon: const Icon(Icons.mode_night_outlined),
            borderRadius: BorderRadius.circular(40),
            dropdownColor: Theme.of(context).cardColor,
            items: modes.map((String mode) {
              return DropdownMenuItem<String>(
                value: mode,
                child: Text(mode),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if(newValue != null){
                ThemeMode newTheme;
                if(newValue == 'Light'){
                  newTheme = ThemeMode.light;
                }else if(newValue == 'Dark'){
                  newTheme = ThemeMode.dark;
                }else{
                  newTheme = ThemeMode.system;
                }
                Provider.of<SettingsProvider>(context, listen: false).changeApplicationTheme(newTheme);
                setState(() {
                  currentMode = newValue;
                });
              }
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2,color: Colors.grey),
                borderRadius: BorderRadius.circular(40)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 2, color: Colors.white)
              ),
            ),
          ),
          const SizedBox(height: 8,),

        ],
      ),
    );

  }
}
/*FutureBuilder(
      future: getDocId(),
      builder: (context, snapshot){
        return ListView.builder(
            itemBuilder: (context, index){
              return ListTile(
                title: GetUsersData(docID: docId[index],),
                textColor: Colors.black,
              );
            },
          itemCount: docId.length,
        );
      },
    );

    Text(
              'Account Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
    */
