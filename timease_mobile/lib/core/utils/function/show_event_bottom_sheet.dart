import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/show_broadcast_sheet.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import '../../../constants.dart';

void showEventModelSheet(context, EventModel eventModel,) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16),
              ListTile(
                leading:
                    Icon(Icons.edit_note_rounded, color: kPrimaryColor),
                title: Text('Edit event type'),
                onTap: () {
                  context.pop();
                  context.push(AppRouter.updateEventScreen,
                      extra: eventModel);
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: kPrimaryColor),
                title: Text('Share'),
                onTap: () {
                  SharePlus.instance.share(
                      ShareParams(text: "https://timease-production.up.railway.app/eventId/${eventModel.id!}")
                  );
                  context.pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: kPrimaryColor),
                title: Text('View event type details'),
                onTap: () {
                  context.pop();
                  context.push(
                    AppRouter.eventDetailsScreen,
                    extra: eventModel,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.broadcast_on_personal_outlined, color: kPrimaryColor),
                title: Text('Create a BroadCast'),
                onTap: () {
                  context.pop();
                  showBroadCastBottomSheet(context: context,eventId:  eventModel.id!);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete Event Type'),
                onTap: () {
                  context.pop();
                  UserEventsCubit user = UserEventsCubit.get(context);
                  user.deleteUserEventsItem(
                      eventId: eventModel.id!,
                      userId: CashHelper.getData('userId'));
                },
              ),
          ],
        ),
      );
    },
  );
}
