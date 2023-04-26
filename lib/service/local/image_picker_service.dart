import 'dart:io';

import 'package:hangomamobile/core/widgets/show_message_helper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static ImageSource camera = ImageSource.camera; // open camera
  static ImageSource gallery = ImageSource.gallery; // open gallery

  static File? selectedImage; // path of file
  static XFile? image; //  file

  static Future<void> selectImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
    File img = File(image!.path);
    selectedImage = img;
    } catch (e) {
      showMessageHelper(e.toString());
    }
  }
}
