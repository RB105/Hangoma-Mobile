import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hangomamobile/service/remote/chat_service.dart';
import 'package:hangomamobile/service/remote/image_upload_service.dart';

class ChatProvider extends ChangeNotifier {
  //INSTANCE
  ChatService chatService = ChatService();

  // CONTROLLERS
  TextEditingController messageController = TextEditingController();
  TextEditingController editmessageController = TextEditingController();

  final Stream<QuerySnapshot> chatStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('created_at')
      .snapshots();

  Future<void> sendMessage() async {
    await chatService.sendMessage(message: messageController.text);
    messageController.clear();
    notifyListeners();
  }

  Future<void> sendFile() async {
    await chatService.sendMessage(message: ImageUploadService.uploadedFilePath);
  }

  Future<void> updateMessage(String id) async {
    await ChatService.updateData(id, editmessageController.text);
  }
}
