import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<void> pickImage({
    required int maxImages,
    required List currentImages,
    required Function(File) onImagePicked,
    required Function(String) onError,
  }) async {
    if (currentImages.length >= maxImages) {
      onError('لا يمكن إضافة اكثر من $maxImages صور');
      return;
    }

    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        onError("No image selected");
        return;
      }
      final file = File(image.path);
      onImagePicked(file);
    } catch (e) {
      onError(e.toString());
    }
  }
}
