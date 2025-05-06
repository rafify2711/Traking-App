import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({required ImageSource source}) async {
  final picked = await ImagePicker().pickImage(source: source);
  return picked != null ? File(picked.path) : null;
}

Future<File?> showImageSourcePicker(BuildContext context) async {
  return await showModalBottomSheet<File?>(
    context: context,
    builder:
        (_) => Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                final image = await pickImage(source: ImageSource.camera);
                log(" ---------------------------------${image?.path ?? ""}");
                Navigator.pop(context , image);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                final image = await pickImage(source: ImageSource.gallery);
                Navigator.pop(context ,image);
              },
            ),
          ],
        ),
  );
}
