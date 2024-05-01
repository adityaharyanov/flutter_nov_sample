import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/presentation/pages/bottomsheet/datepicker_bottomsheet.widget.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/calculator/calculator.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/molecules/activity_entity_button.widget.dart';
import 'package:flutter_nov_trial/utils/view.dart';
import 'package:path_provider/path_provider.dart';

import 'create_activity.viewmodel.dart';

class CreateActivityPage extends RoutableView<CreateActivityViewModel> {
  CreateActivityPage({required super.viewModel, super.key});

  Widget _activityEntitySection(
    BuildContext context,
  ) {
    return Row(
      children: [
        _activityEntityWidget(viewModel.source),
        const SizedBox(
          width: 12,
        ),
        const Icon(Icons.arrow_circle_right),
        const SizedBox(
          width: 12,
        ),
        _activityEntityWidget(viewModel.destination),
      ],
    );
  }

  Widget _activityEntityWidget(Rx<ActivityEntityViewModel> entity) {
    return Expanded(
      child: Obx(() {
        return ActivityEntityButton.fromViewModel(
            entity.value, viewModel.selectActivityEntity);
      }),
    );
  }

  Widget _createDateTimeSection() {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            color: Colors.black,
            padding: const EdgeInsets.all(0),
            onPressed: () {},
          ),
          Expanded(
            child: Obx(() {
              return Text(
                viewModel.dateTimeText,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  // backgroundColor: Colors.black45
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _amountSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey)),
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          Text(
            viewModel.currencySymbol,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Text(
                  viewModel.output.value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createNotesAttachmentSection(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.note_alt),
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(0),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => viewModel.notes.value = value,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 11),
                hintText: "Add a notes",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRecurrenceSection() {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.cyclone),
            color: Colors.black,
            padding: const EdgeInsets.all(0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: SimpleAppBar.create(context,
            titleText: "Create Activity", leftButtonType: LeftButtonType.back),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)),
                ),
                child: Column(
                  children: [
                    _activityEntitySection(context),
                    const SizedBox(
                      height: 12,
                    ),
                    _amountSection(),
                    const SizedBox(
                      height: 12,
                    ),
                    _createNotesAttachmentSection(context),
                    const SizedBox(
                      height: 12,
                    ),
                    _createDateTimeSection(),
                    const SizedBox(
                      height: 12,
                    ),
                    _createRecurrenceSection(),
                    const SizedBox(
                      height: 12,
                    ),
                    CalculatorWidget(
                        viewModel: viewModel.calculatorVM,
                        onTapDateTime: viewModel.onTapDateTime,
                        onTapRecurrence: () {},
                        onTapSave: viewModel.createActivity),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
