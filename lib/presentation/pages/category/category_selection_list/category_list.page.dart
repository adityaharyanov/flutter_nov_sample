import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/category_selection_list.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class CategoryListPage extends RoutableView<CategoryListViewModel> {
  CategoryListPage({super.key, required super.viewModel});

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        appBar: SimpleAppBar.create(context,
            titleText: "Select Category", leftButtonType: LeftButtonType.close),
        body: Obx(() {
          return ListView.separated(
            itemCount: viewModel.categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (context, index) {
              var item = viewModel.categories[index];
              return Container(
                padding: EdgeInsets.only(left: item.isParent ? 0 : 20),
                child: ElevatedButton(
                    onPressed: () => viewModel.onItemSelected(item),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Icon(
                              Icons.add_home,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              // backgroundColor: Colors.black45
                            ),
                          ),
                        ),
                      ]),
                    )),
              );
            },
          );
        }),
      ),
    );
  }
}
