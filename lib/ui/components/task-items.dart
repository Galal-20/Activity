import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TaskItem extends StatefulWidget {
  const TaskItem({super.key});


  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (context){},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          )
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (context){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: AppLocalizations.of(context)!.edit,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,top: 8),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          height: MediaQuery.of(context).size.height *0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(width: 15,),
               Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.titleTask,
                        style: Theme.of(context).textTheme.titleLarge
                    ),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor
                ),
                  child: const Icon(
                      Icons.check,
                    color: Colors.white,
                    weight: 80,
                    size: 26,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
