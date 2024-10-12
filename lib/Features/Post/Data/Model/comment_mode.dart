
import '../../Domain/Entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    super.success,
    super.message,
    super.data,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TCommentDataModel.fromJson(json["data"]),
      );
}

class TCommentDataModel extends TCommentDataEntity {
  TCommentDataModel({
    super.data,
    super.pagination,
  });

  factory TCommentDataModel.fromJson(Map<String, dynamic> json) =>
      TCommentDataModel(
        data: json["data"] == null
            ? []
            : List<CommentDataModel>.from(
                json["data"]!.map((x) => CommentDataModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : CommentPaginationModel.fromJson(json["pagination"]),
      );
}

class CommentDataModel extends CommentDataEntity {
  CommentDataModel({
    super.id,
    super.comment,
    super.user,
    super.createdAt,
  });

  factory CommentDataModel.fromJson(Map<String, dynamic> json) =>
      CommentDataModel(
        id: json["id"],
        comment: json["comment"],
        user: json["user"] == null
            ? null
            : CommentUserDataModel.fromJson(json["user"]),
        createdAt: json["created_at"],
      );
}

class CommentUserDataModel extends CommentUserEntity {
  CommentUserDataModel({
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

  factory CommentUserDataModel.fromJson(Map<String, dynamic> json) =>
      CommentUserDataModel(
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

class CommentPaginationModel extends CommentPaginationEntity {
  CommentPaginationModel({
    super.total,
    super.count,
    super.perPage,
    super.currentPage,
    super.totalPages,
    super.isPagination,
  });

  factory CommentPaginationModel.fromJson(Map<String, dynamic> json) =>
      CommentPaginationModel(
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
