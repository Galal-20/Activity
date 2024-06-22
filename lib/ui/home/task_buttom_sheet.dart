import 'package:activity/ui/components/custom-text-form-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController disTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
              AppLocalizations.of(context)!.addTasks,
              style: Theme.of(context).textTheme.titleLarge),
          CustomTextFormField(
            labelText: AppLocalizations.of(context)!.titleTask,
            controller: titleTextEditingController,
          ),
          CustomTextFormField(
            labelText: AppLocalizations.of(context)!.description,
            controller: disTextEditingController,
            maxLine: 4,
          ),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child:  Text(
              AppLocalizations.of(context)!.addButton,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
