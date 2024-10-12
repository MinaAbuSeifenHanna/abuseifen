import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler {
  Future<void> requestPhotoGalleryPermissions() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          throw Exception('Storage permission is required to access the gallery.');
        }
      } else {
        final status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          throw Exception('Manage external storage permission is required to access the gallery.');
        }
      }
    } else if (Platform.isIOS) {
      final status = await Permission.photos.request();
      if (!status.isGranted) {
        throw Exception('Photos permission is required to access the gallery.');
      }
    }
  }
}
