import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => ImagePickState();
}

class ImagePickState extends State<ImagePick> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 65,
          backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
        ),
        Positioned(
          bottom: -10,
          right: -5,
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.person_add_solid,
              color: Colors.white,
            ),
            onPressed: _pickImage,
            iconSize: 30,
          ),
        ),
      ],
    );
  }
}
