import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/presentation/pages/account/settings/settings.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class SettingsPage extends RoutableView<SettingsViewModel> {
  SettingsPage({super.key, required super.viewModel});

  Widget _buildRow(String name, String value) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyles.textStyle1,
            ),
          ),
          Text(
            value,
            style: TextStyles.textStyle1,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: SimpleAppBar.create(context, titleText: "Settings"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildRow("Langauge", "English"),
            _buildRow("Theme", "Light"),
            _buildRow("Default Currenct", "Rp"),
            _buildRow("Currency Format", "Regular"),
            _buildRow("First Day of Week", "Monday"),
            _buildRow("First Day of Month", "1"),
          ],
        ),
      ),
    );
  }
}
