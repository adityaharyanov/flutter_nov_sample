import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class HomeMainPage extends RoutableView<HomeMainViewModel> {
  HomeMainPage({super.key, required super.viewModel});

  Widget _summaryAmountSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blue.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Column(
            children: [
              Text(
                "Total Balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text("Rp 1.000.000.000",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            const SizedBox(
              height: 20,
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
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton.filled(
                    onPressed: () {},
                    icon: const Center(
                        child: Icon(
                      Icons.chevron_left,
                      size: 25,
                    ))),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Wed, 11 Apr 2024",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton.filled(
                    onPressed: () {},
                    icon: const Center(
                        child: Icon(
                      Icons.chevron_right,
                      size: 25,
                    ))),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryChartSection() {
    var section1 = PieChartSectionData(
      value: 20,
      color: Colors.red,
      radius: 40,
      showTitle: false,

      // borderSide: const BorderSide(width: 5)
    );
    var section2 = PieChartSectionData(
      value: 40,
      color: Colors.blue,
      radius: 40,
      showTitle: false,
    );
    var section3 = PieChartSectionData(
      value: 10,
      color: Colors.green,
      radius: 40,
      showTitle: false,
    );

    // var section1 = const PieChartData(
    //   percent: 20,
    //   color: Colors.red,
    // );
    // var section2 = const PieChartData(
    //   percent: 30,
    //   color: Colors.blue,
    // );
    // var section3 = const PieChartData(
    //   percent: 50,
    //   color: Colors.green,
    // );

    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              child:
                  //   PieChart(
                  //   data: [section1, section2, section3],
                  //   radius: 0,
                  //   strokeWidth: 30,
                  // )
                  PieChart(
                PieChartData(
                    sections: [section1, section2, section3],
                    // centerSpaceRadius: 70,
                    // centerSpaceColor: Colors.black,
                    sectionsSpace: 5),
                swapAnimationCurve: Curves.linear,
                swapAnimationDuration: const Duration(seconds: 1),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 5,
            itemBuilder: _categoryItem,
            separatorBuilder: (context, index) => const SizedBox(
              height: 14,
            ),
          )),
        ],
      ),
    );
  }

  Widget _categoryItem(BuildContext context, int index) {
    var list = [
      ("Entertainment", Colors.red),
      ("Food & Drink", Colors.blue),
      ("Transport", Colors.green),
      ("----", Colors.grey),
      ("----", Colors.grey),
    ];
    return Container(
        child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: list[index].$2, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          list[index].$1,
          style: TextStyles.textStyle3,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              _summaryAmountSection(),
              _summaryChartSection(),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
