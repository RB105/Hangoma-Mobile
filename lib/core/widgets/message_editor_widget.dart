import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/chat_provider.dart';
import 'package:hangomamobile/service/remote/chat_service.dart';
import 'package:provider/provider.dart';

class MessageEditorWidget extends StatefulWidget {
  final String id;
  final String message;
  const MessageEditorWidget(
      {super.key, required this.id, required this.message});

  @override
  State<MessageEditorWidget> createState() => _MessageEditorWidgetState();
}

class _MessageEditorWidgetState extends State<MessageEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      builder: (context, child) {
        return AlertDialog(
          title: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<ChatProvider>(context, listen: false)
                        .editmessageController
                        .text = widget.message;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: TextFormField(
                          controller: context
                              .watch<ChatProvider>()
                              .editmessageController,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ChatProvider>()
                                    .updateMessage(widget.id)
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text("Submit"))
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: const [Icon(Icons.edit), Text("Edit")],
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await ChatService.removeData(widget.id).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: const [Icon(Icons.delete), Text("Delete")],
                  ))
            ],
          ),
        );
      },
    );
  }
}
