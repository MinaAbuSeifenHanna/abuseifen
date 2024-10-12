import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

class NewCommentsResponse {
  final Data data;

  NewCommentsResponse({
    required this.data,
  });

  NewCommentsResponse copyWith({
    Data? data,
  }) =>
      NewCommentsResponse(
        data: data ?? this.data,
      );

  factory NewCommentsResponse.fromJson(Map<String, dynamic> json) => NewCommentsResponse(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Comment>? data;
  final Pagination? pagination;

  Data({
    this.data,
    this.pagination,
  });

  Data copyWith({
    List<Comment>? data,
    Pagination? pagination,
  }) =>
      Data(
        data: data ?? this.data,
        pagination: pagination ?? this.pagination,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null ? [] : List<Comment>.from(json["data"].map((x) => Comment.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      );
}

class Comment {
  final int id;
  final String? comment;
  final RegisterDataResponse? user;

  Comment({
    required this.id,
    this.comment,
    this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        comment: json["comment"],
        user: json["user"] == null ? null : RegisterDataResponse.fromJson(json["user"]),
      );

  Comment copyWith({
    int? id,
    String? comment,
    RegisterDataResponse? user,
  }) =>
      Comment(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        user: user ?? this.user,
      );
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final bool isPagination;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.isPagination,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        isPagination: json["is_pagination"],
      );

  Pagination copyWith({
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages,
    bool? isPagination,
  }) =>
      Pagination(
        total: total ?? this.total,
        count: count ?? this.count,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        isPagination: isPagination ?? this.isPagination,
      );
}
