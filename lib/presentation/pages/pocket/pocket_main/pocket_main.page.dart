import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/pocket_list.page.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/pocket_list.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/text_button.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/scaffold_page_state.widget.dart';
import 'package:flutter_nov_trial/utils/view.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class PocketMainPage extends RoutableView<PocketMainViewModel> {
  PocketMainPage({required super.viewModel, super.key});

  Widget _createHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: media.size.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.lightBlue,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyles.textStyle2,
                  ),
                  Obx(() => Text(
                        viewModel.totalBalanceText,
                        style: TextStyles.textStyle2,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      const Icon(Icons.broken_image),
                      Column(
                        children: [
                          Text(
                            "Total Income",
                            style: TextStyles.textStyle1,
                          ),
                          Text(
                            "Rp 100.000.000",
                            style: TextStyles.textStyle3,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      const Icon(Icons.broken_image),
                      Column(
                        children: [
                          Text(
                            "Total Expense",
                            style: TextStyles.textStyle1,
                          ),
                          Text(
                            "Rp 100.000.000",
                            style: TextStyles.textStyle3,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createPocketListSection() {
    var section = viewModel.pocketMaps[viewModel.selectedType.value];
    if (section == null) return Container();
    return PocketListPage(viewModel: section);
  }

  List<Widget> _buildButtonSelectionWidgets() {
    List<Widget> widgets = List.empty(growable: true);
    for (var e in viewModel.pocketMaps.values) {
      widgets.add(Expanded(child: _buildButtonSelectionWidget(e)));

      if (e != viewModel.pocketMaps.values.last) {
        widgets.add(const SizedBox(
          width: 20,
        ));
      }
    }

    return widgets;
  }

  Widget _buildButtonSelectionWidget(PocketListViewModel item) {
    return GestureDetector(
      onTap: () => viewModel.changeListSection(item.type),
      child: Obx(() => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (item.type == viewModel.selectedType.value)
                  ? Colors.red.shade500
                  : Colors.red.shade300,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  item.type.name,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "${item.pocketCount} Pocket(s)",
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildPage(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade300,
          width: media.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _createHeaderSection(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: media.size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: MainTextButton(
                        label: "Create New Pocket",
                        backgroundColor: Colors.teal,
                        onPressed: () => viewModel.createNewPocket(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: MainTextButton(
                        label: "Transfer Balance",
                        backgroundColor: Colors.teal,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: _buildButtonSelectionWidgets(),
                ),
              ),
              _createPocketListSection()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ScaffoldPageObserver(
        viewModel: viewModel, contentWidgetBuilder: _buildPage);
  }
}
