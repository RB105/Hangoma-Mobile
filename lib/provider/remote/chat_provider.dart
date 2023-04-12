import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hangomamobile/service/remote/chat_service.dart';

class ChatProvider extends ChangeNotifier {

  //INSTANCE
  ChatService chatService = ChatService();

  // CONTROLLERS
  TextEditingController messageController = TextEditingController();

  final Stream<QuerySnapshot> chatStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('created_at')
      .snapshots();

  Future<void> sendMessage() async {
    await chatService.sendMessage(message: messageController.text);
    messageController.clear();
    notifyListeners();
  }
}
