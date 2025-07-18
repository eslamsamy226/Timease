import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/rich_text_button.dart';
import '../../../data/models/notifications_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.index,
    required this.notifications,
    required this.onTap,
  });

  final int index;
  final Notifications notifications;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final createdAt = notifications.createdAt != null
        ? DateFormat.yMMMMd()
        .add_jm()
        .format(DateTime.parse(notifications.createdAt!))
        : 'Unknown date';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: !notifications.isRead! ? Color(0xfff6fbff) : null,
          border: Border(
            top: BorderSide(
              color: Color(0xffeaebed),
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/google-meet.png",
              height: 65,
              width: 65,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextButton(
                    title: notifications.title!,
                    message: notifications.message!,
                    date: createdAt,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
