import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangomamobile/core/widgets/show_message_helper.dart';

class ChatService {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  Future<void> sendMessage({required String message}) async {
    try {
      await messages.add({
        "message": message,
        "token": FirebaseAuth.instance.currentUser!.uid,
        "user": FirebaseAuth.instance.currentUser!.email.toString(),
        "created_at": FieldValue.serverTimestamp()
      });
    } on FirebaseException catch (e) {
      showMessageHelper(e.toString());
    }
  }

  static Future<void> removeData(String id) async {
   await FirebaseFirestore.instance.doc("messages/$id").delete();
  }

  static Future<void> updateData(String id,String message) async {
   await FirebaseFirestore.instance.doc("messages/$id").set({"message": message,
        "token": FirebaseAuth.instance.currentUser!.uid,
        "user": FirebaseAuth.instance.currentUser!.email.toString(),
        "created_at": FieldValue.serverTimestamp()});
  }
}
