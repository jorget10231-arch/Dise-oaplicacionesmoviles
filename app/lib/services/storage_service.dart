import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  Future<String> uploadEvidence({
    required String inspectionId,
    required File file,
  }) async {
    final reference = _storage
        .ref()
        .child('inspections/$inspectionId/evidence/${DateTime.now().millisecondsSinceEpoch}');

    await reference.putFile(file);
    return reference.getDownloadURL();
  }
}
