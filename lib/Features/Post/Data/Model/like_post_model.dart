
import '../../Domain/Entities/like_entity.dart';

class PostLikeModel extends LikeEntity {
  PostLikeModel({
    super.success,
    super.message,
    super.data,
  });

  factory PostLikeModel.fromJson(Map<String, dynamic> json) => PostLikeModel(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : TLikeDataModel.fromJson(json["data"]),
      );
}

class TLikeDataModel extends TLikeDataEntity {
  TLikeDataModel({
    super.data,
    super.pagination,
  });

  factory TLikeDataModel.fromJson(Map<String, dynamic> json) => TLikeDataModel(
        data: json["data"] == null
            ? []
            : List<LikeDataModel>.from(
                json["data"]!.map((x) => LikeDataModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : LikePaginationModel.fromJson(json["pagination"]),
      );
}

class LikeDataModel extends LikeDataEntity {
  LikeDataModel({
    super.id,
    super.user,
    super.createdAt,
  });

  factory LikeDataModel.fromJson(Map<String, dynamic> json) => LikeDataModel(
        id: json["id"],
        user:
            json["user"] == null ? null : LikeUserModel.fromJson(json["user"]),
        createdAt: json["created_at"],
      );
}

class LikeUserModel extends LikeUserEntity {
  LikeUserModel({
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

  factory LikeUserModel.fromJson(Map<String, dynamic> json) => LikeUserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        userName: json["user_name"],
        image: json["image"],
        bio: json["bio"],
        address: json["address"],
        gender: json["gender"],
        completeProfile: json["complete_profile"],
        token: json["token"],
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

class LikePaginationModel extends LikePaginationEntity {
  LikePaginationModel({
    super.total,
    super.count,
    super.perPage,
    super.currentPage,
    super.totalPages,
    super.isPagination,
  });

  factory LikePaginationModel.fromJson(Map<String, dynamic> json) =>
      LikePaginationModel(
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
