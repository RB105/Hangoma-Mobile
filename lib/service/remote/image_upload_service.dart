import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hangomamobile/core/widgets/show_message_helper.dart';

class ImageUploadService {
  static String uploadedFilePath = "";

  static Future<void> uploadFile(File file, String folderName) async {
    try {

      var snapshot = await FirebaseStorage.instance
          .ref()
          .child("$folderName/${FirebaseAuth.instance.currentUser!.email}") // uploading with user's email name
          .putFile(file);
      uploadedFilePath = await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      showMessageHelper(e.message.toString());
    }
  }
}
