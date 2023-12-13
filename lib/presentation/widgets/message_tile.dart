import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/message_response.dart';

class MessageTile extends StatelessWidget {
  final MessageResponse message;
  const MessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat formatter = DateFormat('HH:mm');
    return ListTile(
      leading: CircleAvatar(
          radius: 25,
          child: Text(
            message.name[0],
            style: textTheme.labelMedium,
          )),
      title: Text(
        message.name,
        style: textTheme.labelMedium,
      ),
      subtitle: Text(
        message.message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.labelSmall,
      ),
      trailing: Text(
        formatter.format(message.date),
        style: textTheme.labelSmall,
      ),
    );
  }
}
