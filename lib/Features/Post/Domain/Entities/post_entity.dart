import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final bool? success;
  final String? message;
  final TPostDataEntity? data;

  PostEntity({
    this.success,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class TPostDataEntity extends Equatable {
  final List<PostDataEntity>? data;
  final PostPaginationEntity? pagination;

  TPostDataEntity({
    this.data,
    this.pagination,
  });

  @override
  List<Object?> get props => [
        data,
        pagination,
      ];
}

class PostDataEntity extends Equatable {
  final int? id;
  final PostUserEntity? user;
  final List<FilesEntity>? files;
  final String? caption;
  final String? lat;
  final String? lng;
  final String? audience;
  final String? audienceLabel;
  final String? location;
  final String? likes;
  final String? comments;
  final String? shares;
  final String? active;
  final String? createdAt;

  PostDataEntity({
    this.id,
    this.user,
    this.files,
    this.caption,
    this.lat,
    this.lng,
    this.audience,
    this.audienceLabel,
    this.location,
    this.likes,
    this.comments,
    this.shares,
    this.active,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        files,
        caption,
        lat,
        lng,
        audience,
        audienceLabel,
        location,
        likes,
        comments,
        shares,
        active,
        createdAt
      ];
}

class FilesEntity extends Equatable {
  final int? id;
  final String? type;
  final String? path;

  FilesEntity({
    this.id,
    this.type,
    this.path,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        path,
      ];
}

class PostUserEntity extends Equatable {
  final int? id;
  final String? email;
  final String? name;
  final String? userName;
  final String? image;
  final String? bio;
  final String? address;
  final String? gender;
  final bool? completeProfile;
  final String? token;

  PostUserEntity({
    this.id,
    this.email,
    this.name,
    this.userName,
    this.image,
    this.bio,
    this.address,
    this.gender,
    this.completeProfile,
    this.token,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        userName,
        image,
        bio,
        address,
        gender,
        completeProfile,
        token,
      ];
}

class PostPaginationEntity extends Equatable {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final bool? isPagination;

  PostPaginationEntity({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.isPagination,
  });

  @override
  List<Object?> get props => [
        total,
        count,
        perPage,
        currentPage,
        totalPages,
        isPagination,
      ];
}
