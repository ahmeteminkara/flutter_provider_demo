import 'package:flutter/material.dart';

enum MessageType {
  Loaging,
  Warning,
  Error,
  Info,
}

class MessageBoxCard extends StatelessWidget {
  final String msg;
  final MessageType type;

  const MessageBoxCard({this.msg, this.type = MessageType.Info});

  leading(MessageType type) {
    switch (type) {
      case MessageType.Error:
        return Icon(Icons.error);
        break;

      case MessageType.Loaging:
        return CircularProgressIndicator();
        break;

      case MessageType.Warning:
        return Icon(Icons.warning);
        break;
      default:
        return Icon(Icons.info);
        break;
    }
  }

  @override
  Card build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leading(type),
        title: Text(msg),
      ),
    );
  }
}
