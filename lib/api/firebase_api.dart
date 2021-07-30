import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch(e) {
      return null;
    }
  }

  static void deleteFile(String url) {
    try {
      FirebaseStorage.instance.refFromURL(url).delete();
    } on FirebaseException catch(e) {
      print('No such link');
    }
  }

}