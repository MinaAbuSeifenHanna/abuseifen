import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final bool? success;
  final String? message;
  final TCommentDataEntity? data;

  CommentEntity({
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

class TCommentDataEntity extends Equatable {
  final List<CommentDataEntity>? data;
  final CommentPaginationEntity? pagination;

  TCommentDataEntity({
    this.data,
    this.pagination,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        data,
        pagination,
      ];
}

class CommentDataEntity extends Equatable {
  final int? id;
  final String? comment;
  final CommentUserEntity? user;
  final String? createdAt;

  CommentDataEntity({
    this.id,
    this.comment,
    this.user,
    this.createdAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        comment,
        user,
        createdAt,
      ];
}

class CommentUserEntity extends Equatable {
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

  CommentUserEntity({
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
  // TODO: implement props
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

class CommentPaginationEntity extends Equatable {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final bool? isPagination;

  CommentPaginationEntity({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.isPagination,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        total,
        count,
        perPage,
        currentPage,
        totalPages,
        isPagination,
      ];
}
