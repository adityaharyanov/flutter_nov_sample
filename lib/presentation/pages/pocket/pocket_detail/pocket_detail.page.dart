import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_detail/pocket_detail.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/outlined_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/wrapped_bottomsheet.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/molecules/activity_entity_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class PocketDetailPage extends RoutableView<PocketDetailViewModel> {
  PocketDetailPage({super.key, required super.viewModel});

  Widget _amountSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey)),
      alignment: Alignment.bottomRight,
      child: const Row(
        children: [
          Text(
            "Currency",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Text(
                "Ep asdawd",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
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
            child: Text(
              "",
              style: TextStyles.textStyle2,
            ),
          ),
          IconButton(
              onPressed: () => {}, //_onTapAttachment(context),
              icon: const Icon(Icons.image))
        ],
      ),
    );
  }

  Widget _activityEntityWidget(BuildContext context) {
    return Expanded(
        child: ActivityEntityButton(
      title: "titlkyee",
      name: "Nameeee",
      image: Icons.account_balance,
      onTap: () => {},
    ));
  }

  Widget _activityEntitySection(
    BuildContext context,
  ) {
    return Row(
      children: [
        _activityEntityWidget(context),
        const SizedBox(
          width: 12,
        ),
        const Icon(Icons.arrow_circle_right),
        const SizedBox(
          width: 12,
        ),
        _activityEntityWidget(context),
      ],
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
          const Expanded(
            child: Text(
              "Datetime",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
                // backgroundColor: Colors.black45
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
          const Expanded(
            child: Text(
              "Recurrence",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
                // backgroundColor: Colors.black45
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelSection(String title, String value) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyles.textStyle1,
          ),
          Text(
            value,
            style: TextStyles.textStyle2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: SimpleAppBar.create(context, titleText: "Pocket Detail"),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Column(
          children: [
            _labelSection("Name", viewModel.name),
            const SizedBox(
              height: 12,
            ),
            _labelSection("Description", viewModel.description),
            const SizedBox(
              height: 12,
            ),
            _labelSection("Currency", viewModel.currency.symbol),
            const SizedBox(
              height: 12,
            ),
            _labelSection("Type", viewModel.type.name),
            const SizedBox(
              height: 12,
            ),
            _labelSection("Amount", viewModel.amount.toStringDecimal()),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MainOutlinedButton(
                    topText: "Edit",
                    bottomText: "",
                    onTap: viewModel.onTapEdit,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: MainOutlinedButton(
                    topText: "Favourite",
                    bottomText: "",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: MainOutlinedButton(
                    topText: "Duplicate",
                    bottomText: "",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: MainOutlinedButton(
                    topText: "Delete",
                    bottomText: "",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
