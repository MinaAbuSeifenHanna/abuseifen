import 'package:hypelify_v2/Core/Handler/permissions_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaService {
  Future<List<AssetPathEntity>> fetchAlbums({bool videosOnly = false}) async {
    // Check permissions
    await PermissionsHandler().requestPhotoGalleryPermissions();

    // Fetch media albums
    final albums = await PhotoManager.getAssetPathList(
      type: videosOnly ? RequestType.video : RequestType.common,
    );
    return albums;
  }
}
