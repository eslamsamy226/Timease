import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_search.dart';
import 'widgets/custom_filter_bottom_sheet.dart';
import 'widgets/custom_filter_row.dart';
import 'widgets/custom_meeting_box.dart';

class MeetingsScreenViewBody extends StatefulWidget {
  const MeetingsScreenViewBody({super.key});

  @override
  State<MeetingsScreenViewBody> createState() => _MeetingsScreenViewBodyState();
}

class _MeetingsScreenViewBodyState extends State<MeetingsScreenViewBody> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomSearch(
          eventListModel:[],
          controller: controller,
          text: 'Search event Types...',
        ),
        SizedBox(
          height: 7,
        ),
        Divider(),
        SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            color: kSecPrimaryColor[200],
            child: CustomFilterRow(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomFilterBottomSheet();
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => CustomMeetingBox(),
          ),
        ),
      ],
    );
  }
}
