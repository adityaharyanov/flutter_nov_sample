import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/outlined_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/wrapped_bottomsheet.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/molecules/activity_entity_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class ActivityDetailPage extends RoutableView<ActivityDetailViewModel> {
  ActivityDetailPage({super.key, required super.viewModel});

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
              child: Text(
                viewModel.amount,
                style: const TextStyle(
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
              viewModel.notes,
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

  Widget _activityEntityWidget(
      BuildContext context, ActivityEntityViewModel viewModel) {
    return Expanded(
        child: ActivityEntityButton(
      title: viewModel.titleLabel,
      name: viewModel.name,
      image: viewModel.image,
      onTap: () => {},
    ));
  }

  Widget _activityEntitySection(
    BuildContext context,
  ) {
    return Row(
      children: [
        _activityEntityWidget(context, viewModel.source),
        const SizedBox(
          width: 12,
        ),
        const Icon(Icons.arrow_circle_right),
        const SizedBox(
          width: 12,
        ),
        _activityEntityWidget(context, viewModel.destination),
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
          Expanded(
            child: Text(
              viewModel.datetimeText,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: const TextStyle(
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: SimpleAppBar.create(context, titleText: "Activity Detail"),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
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
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: viewModel.onTapEdit,
                          child: const Text("Edit"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: viewModel.onTapFavorite,
                          child: const Text("Favorite"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: viewModel.onTapDuplicate,
                          child: const Text("Make Copy"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: viewModel.onTapDelete,
                          child: const Text("Delete"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
