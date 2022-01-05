import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class ExtStorage {
  static const MethodChannel _channel = const MethodChannel('ext_storage');

  static final String directoryMusic = "Music";

  static final String directoryPodcasts = "Podcasts";

  static final String direcoryRingtones = "Ringtones";

  static final String directoryAlarms = "Alarms";

  static final String directoryNotifications = "Notifications";

  static final String directoryPictures = "Pictures";

  static final String directoryMovies = "Movies";

  static final String directoryDownload = "Download";

  static final String directoryDCIM = "DCIM";

  static final String directoryDocuments = "Documents";

  static final String directoryScreenshots = "Screenshots";

  static final String directoryAudiobooks = "Audiobooks";

  static Future<String> getExternalStorageDirectory() async {
    if (!Platform.isAndroid) {
      throw PlatformException(
          code: "isNotAndroid", message: "This plugin only works on Android.");
    }
    return await _channel.invokeMethod('getExternalStorageDirectory');
  }

  static Future<String> getExternalStoragePublicDirectory(String type) async {
    if (!Platform.isAndroid) {
      throw PlatformException(
          code: "isNotAndroid", message: "This plugin only works on Android.");
    }
    return await _channel
        .invokeMethod('getExternalStoragePublicDirectory', {"type": type});
  }
  
    static Future<String> getExternalFilesDir(String type) async {
    if (!Platform.isAndroid) {
      throw PlatformException(
          code: "isNotAndroid", message: "This plugin only works on Android.");
    }
    return await _channel
        .invokeMethod('getExternalFilesDir', {"type": type});
  }
}
