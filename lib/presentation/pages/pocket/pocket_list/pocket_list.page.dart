import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/pocket_list.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/subviews/pocket_list_item.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PocketListPage extends BaseView<PocketListViewModel> {
  PocketListPage({required super.viewModel, super.key});

  Widget _createProgressedPocketItem(
      BuildContext context, PocketListItemViewModel item) {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          item.totalAmount,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.broken_image),
                            Column(
                              children: [
                                Text(
                                  "Total Income",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rp 100.000.000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.broken_image),
                            Column(
                              children: [
                                Text(
                                  "Total Expense",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rp 100.000.000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 1000,
                      percent: 0.9,
                      center: const Center(
                        child: Text(
                          "90.0%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      barRadius: const Radius.circular(10),
                      progressColor: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createRegularPocketItem(
      BuildContext context, PocketListItemViewModel item) {
    return GestureDetector(
      onTap: () => viewModel.parentVM.router.pushPocketDetail(item.model),
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          item.totalAmount,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.broken_image),
                            Column(
                              children: [
                                Text(
                                  "Total Income",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rp 100.000.000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.broken_image),
                            Column(
                              children: [
                                Text(
                                  "Total Expense",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rp 100.000.000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createPocketItem(BuildContext context, PocketListItemViewModel item) {
    switch (item.model.type) {
      case PocketType.fund:
        return _createRegularPocketItem(context, item);
      case PocketType.debt:
        return _createProgressedPocketItem(context, item);
      case PocketType.investment:
        return _createProgressedPocketItem(context, item);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        width: media.size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Container(
              width: media.size.width,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                viewModel.title,
                style: TextStyles.textStyle2,
                textAlign: TextAlign.start,
              ),
            ),
            ListView.builder(
                itemCount: viewModel.pocketCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _createPocketItem(context, viewModel.pockets[index]);
                }),
          ],
        ));
  }
}
