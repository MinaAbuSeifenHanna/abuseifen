
import '../../Domain/Entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    super.success,
    super.message,
    super.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : TPostDataModel.fromJson(json["data"]),
      );
}

class TPostDataModel extends TPostDataEntity {
  TPostDataModel({
    super.data,
    super.pagination,
  });

  factory TPostDataModel.fromJson(Map<String, dynamic> json) => TPostDataModel(
        data: json["data"] == null
            ? []
            : List<PostDataModel>.from(
                json["data"]!.map((x) => PostDataModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : PostPaginationModel.fromJson(json["pagination"]),
      );
}

class PostDataModel extends PostDataEntity {
  PostDataModel({
    super.id,
    super.user,
    super.files,
    super.caption,
    super.lat,
    super.lng,
    super.audience,
    super.audienceLabel,
    super.location,
    super.likes,
    super.comments,
    super.shares,
    super.active,
    super.createdAt,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        id: json["id"],
        user:
            json["user"] == null ? null : PostUserModel.fromJson(json["user"]),
        files: json["files"] == null
            ? []
            : List<FileModel>.from(
                json["files"]!.map((x) => FileModel.fromJson(x))),
        caption: json["caption"] ?? '',
        lat: json["lat"] ?? '',
        lng: json["lng"] ?? '',
        audience: json["audience"] ?? '',
        audienceLabel: json["audience_label"] ?? '',
        location: json["location"] ?? '',
        likes: json["likes"] ?? '',
        comments: json["comments"] ?? '',
        shares: json["shares"] ?? '',
        active: json["active"] ?? '',
        createdAt: json["created_at"] ?? '',
      );
}

class FileModel extends FilesEntity {
  FileModel({
    super.id,
    super.type,
    super.path,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        id: json["id"] ?? 0,
        type: json["type"] ?? '',
        path: json["path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "path": path,
      };
}

class PostUserModel extends PostUserEntity {
  PostUserModel({
    super.id,
    super.email,
    super.name,
    super.userName,
    super.image,
    super.bio,
    super.address,
    super.gender,
    super.completeProfile,
    super.token,
  });

  factory PostUserModel.fromJson(Map<String, dynamic> json) => PostUserModel(
        id: json["id"] ?? 0,
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        userName: json["user_name"] ?? '',
        image: json["image"] ?? '',
        bio: json["bio"] ?? '',
        address: json["address"] ?? '',
        gender: json["gender"] ?? '',
        completeProfile: json["complete_profile"] ?? false,
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "user_name": userName,
        "image": image,
        "bio": bio,
        "address": address,
        "gender": gender,
        "complete_profile": completeProfile,
        "token": token,
      };
}

class PostPaginationModel extends PostPaginationEntity {
  PostPaginationModel({
    super.total,
    super.count,
    super.perPage,
    super.currentPage,
    super.totalPages,
    super.isPagination,
  });

  factory PostPaginationModel.fromJson(Map<String, dynamic> json) =>
      PostPaginationModel(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        isPagination: json["is_pagination"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "is_pagination": isPagination,
      };
}
