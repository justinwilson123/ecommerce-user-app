import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

multiFileUploadGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: true,
    // lockParentWindow: true,
    // withData: true,
    // allowedExtensions: ["png", "PNG", "jpg", "JPG", "jpeg", "gif"],
  );
  if (result != null) {
    return result.paths.map((path) => File(path!)).toList();
  } else {
    return <File>[];
  }
}

videoUploadGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.video,
    // allowedExtensions: ["mp4"],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
