import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';

typedef ActivityEntityButtonOnTap = Function(
    {required ActivityFlowType flowType});

class ActivityEntityButton extends StatelessWidget {
  final String title;
  final IconData image;
  final String name;
  final Function()? onTap;

  const ActivityEntityButton(
      {required this.title,
      required this.image,
      required this.name,
      this.onTap,
      super.key});

  factory ActivityEntityButton.fromViewModel(
      ActivityEntityViewModel viewModel, ActivityEntityButtonOnTap onTap) {
    return ActivityEntityButton(
      title: viewModel.titleLabel,
      image: viewModel.image,
      name: viewModel.name,
      onTap: () => onTap(flowType: viewModel.activityFlowType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
            Row(
              children: [
                Icon(
                  image,
                  size: 30,
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
