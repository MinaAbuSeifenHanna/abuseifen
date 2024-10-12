import 'package:equatable/equatable.dart';

class LikeEntity extends Equatable {
  final bool? success;
  final String? message;
  final TLikeDataEntity? data;

  LikeEntity({
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

class TLikeDataEntity extends Equatable {
  final List<LikeDataEntity>? data;
  final LikePaginationEntity? pagination;

  TLikeDataEntity({
    this.data,
    this.pagination,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data, pagination];
}

class LikeDataEntity extends Equatable {
  final int? id;
  final LikeUserEntity? user;
  final String? createdAt;

  LikeDataEntity({
    this.id,
    this.user,
    this.createdAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        user,
        createdAt,
      ];
}

class LikeUserEntity extends Equatable {
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

  LikeUserEntity({
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

class LikePaginationEntity extends Equatable {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final bool? isPagination;

  LikePaginationEntity({
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
