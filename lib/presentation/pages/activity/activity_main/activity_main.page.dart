import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';

import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/usecases/activity/activity.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.page.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_list_item.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_list_section.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/create_activity.page.dart';
import 'package:flutter_nov_trial/utils/global.dart';
import 'package:flutter_nov_trial/utils/view.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class ActivityMainPage extends RoutableView<ActivityMainViewModel> {
  final String title = 'Activity';

  ActivityMainPage({required super.viewModel, super.key});

  AppBar _createAppBar() {
    return AppBar(
      // TRY THIS: Try changing the color here to a specific color (to
      // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      // change color while the other colors stay the same.
      backgroundColor: Colors.tealAccent,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(title),
    );
  }

  Widget createGroupSectionWidget(ActivityListSectionViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: Colors.grey,
      child: Row(
        children: [
          Expanded(child: Text('${viewModel.day}, ${viewModel.date}')),
          Text(viewModel.totalIncome),
          const SizedBox(
            width: 8,
          ),
          Text(viewModel.totalExpense),
        ],
      ),
    );
  }

  Widget createGroupItemWidget(
      BuildContext context, ActivityListSectionViewModel section, int index) {
    var item = section.items[index];
    var model = item.model;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: GestureDetector(
        onTap: () => viewModel.onTapActivityItem(model),
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.ads_click_rounded,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_alarm),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            item.sourceName,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(Icons.arrow_circle_right),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            item.destinationName,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(item.notes),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.amount,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(item.time),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _createAppBar(),
      body: Obx(() {
        return StickyGroupedListView<ActivityListSectionViewModel, String>(
          elements: viewModel.activityListSections.value,
          groupBy: (item) => item.date,
          groupSeparatorBuilder: createGroupSectionWidget,
          itemBuilder: (context, item) {
            return ListView.builder(
                itemCount: item.items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return createGroupItemWidget(context, item, index);
                });
          },
          // itemComparator: (e1, e2) => e1['name'].compareTo(e2['name']), // optional
          // elementIdentifier: (element) => element.name // optional - see below for usage
          // itemScrollController: itemScrollController, // optional
          order: StickyGroupedListOrder.DESC, // optional
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.onTapCreateActivity,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
