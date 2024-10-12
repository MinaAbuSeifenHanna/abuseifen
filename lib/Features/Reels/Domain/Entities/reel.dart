import 'package:equatable/equatable.dart';

class ReelsEntity extends Equatable {
  final bool? success;
  final String? message;
  final ReelsTDataEntity? data;

  ReelsEntity({
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

class ReelsTDataEntity {
  final List<ReelsDataEntity>? data;
  final PaginationEntity? pagination;

  ReelsTDataEntity({
    this.data,
    this.pagination,
  });
}

class ReelsDataEntity extends Equatable {
  final int? id;
  final ReelsUserEntity? reelsUserEntity;
  final String? caption;
  final dynamic lat;
  final dynamic lng;
  final String? audience;
  final String? location;
  final String? likes;
  final String? comments;
  final String? shares;
  final String? type;
  final String? reelPath;
  final String? processedPath;

  ReelsDataEntity({
    this.id,
    this.reelsUserEntity,
    this.caption,
    this.lat,
    this.lng,
    this.audience,
    this.location,
    this.likes,
    this.comments,
    this.shares,
    this.type,
    this.reelPath,
    this.processedPath,
  });

  @override
  List<Object?> get props => [
        id,
        reelsUserEntity,
        caption,
        lat,
        lng,
        audience,
        location,
        likes,
        comments,
        shares,
        type,
        reelPath,
        processedPath,
      ];
}

class ReelsUserEntity extends Equatable {
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

  ReelsUserEntity({
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

class PaginationEntity extends Equatable {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final bool? isPagination;

  PaginationEntity({
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
