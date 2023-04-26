import 'package:flutter/material.dart';
import 'package:hangomamobile/service/local/image_picker_service.dart';
import 'package:hangomamobile/service/remote/image_upload_service.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  void initState() {
    ImagePickerService.selectedImage = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: ImagePickerService.selectedImage == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Choose"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.camera_alt),
                      ElevatedButton(
                          onPressed: () async {
                            await ImagePickerService.selectImage(
                                ImagePickerService.camera);
                            setState(() {});
                          },
                          child: const Text("Camera")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.photo),
                      ElevatedButton(
                          onPressed: () async {
                            await ImagePickerService.selectImage(
                                ImagePickerService.gallery);
                            setState(() {});
                          },
                          child: const Text("Gallery")),
                    ],
                  )
                ],
              )
            : const SizedBox(),
        actions: ImagePickerService.selectedImage != null
            ? [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () async {
                      await ImageUploadService.uploadFile(
                          ImagePickerService.selectedImage!, 'chat').then((value) {
                            Navigator.pop(context);
                          });
                          
                    },
                    child: const Text("OK"))
              ]
            : [const SizedBox()],
        content: ImagePickerService.selectedImage != null
            ? Image.file(ImagePickerService.selectedImage!)
            : const SizedBox());
  }
}
