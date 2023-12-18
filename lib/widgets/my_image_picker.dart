import 'dart:io';
import 'package:ebike/widgets/my_rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// ... Your existing imports and code ...

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _pickImage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } else if (status.isDenied) {
      // Handle denied permission
    } else if (status.isPermanentlyDenied) {
      // Handle permanently denied permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: _image != null
              ? Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : RoundedImage(
                  imageUrl:
                      "https://www.sayarti.tn/wp-content/uploads/2022/03/moez-jomaa-infinite-mobility-970x577.jpg"),
        ),
        const SizedBox(height: 10),
        const Text(
          'Tap to change image',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
