import 'package:hypelify_v2/Features/Reels/Domain/Entities/reel.dart';

class ReelsModels extends ReelsEntity {
  ReelsModels({
    super.success,
    super.message,
    super.data,
  });

  factory ReelsModels.fromJson(Map<String, dynamic> json) => ReelsModels(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ReelsTDataModel.fromJson(json["data"]),
      );
}

class ReelsTDataModel extends ReelsTDataEntity {
  ReelsTDataModel({
    super.data,
    super.pagination,
  });

  factory ReelsTDataModel.fromJson(Map<String, dynamic> json) =>
      ReelsTDataModel(
        data: json["data"] == null
            ? []
            : List<ReelsDataModel>.from(
                json["data"]!.map((x) => ReelsDataModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );
}

class ReelsDataModel extends ReelsDataEntity {
  ReelsDataModel({
    super.id,
    super.reelsUserEntity,
    super.caption,
    super.lat,
    super.lng,
    super.audience,
    super.location,
    super.likes,
    super.comments,
    super.shares,
    super.type,
    super.reelPath,
    super.processedPath,
  });

  factory ReelsDataModel.fromJson(Map<String, dynamic> json) => ReelsDataModel(
        id: json["id"],
        reelsUserEntity:
            json["user"] == null ? null : ReelsUserModel.fromJson(json["user"]),
        caption: json["caption"] ?? '',
        lat: json["lat"] ?? '',
        lng: json["lng"] ?? '',
        audience: json["audience"] ?? '',
        location: json["location"] ?? '',
        likes: json["likes"] ?? '',
        comments: json["comments"] ?? '',
        shares: json["shares"] ?? '',
        type: json["type"] ?? '',
        reelPath: json["reel_path"] ?? '',
        processedPath: json["processed_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "lat": lat,
        "lng": lng,
        "audience": audience,
        "location": location,
        "likes": likes,
        "comments": comments,
        "shares": shares,
        "type": type,
        "reel_path": reelPath,
        "processed_path": processedPath,
      };
}

class ReelsUserModel extends ReelsUserEntity {
  ReelsUserModel({
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

  factory ReelsUserModel.fromJson(Map<String, dynamic> json) => ReelsUserModel(
        id: json["id"],
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

class Pagination extends PaginationEntity {
  Pagination({
    super.total,
    super.count,
    super.perPage,
    super.currentPage,
    super.totalPages,
    super.isPagination,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
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
