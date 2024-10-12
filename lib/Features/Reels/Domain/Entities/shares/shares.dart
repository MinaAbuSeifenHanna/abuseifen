import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

class NewSharesResponse {
  final Data data;

  NewSharesResponse({
    required this.data,
  });

  NewSharesResponse copyWith({
    Data? data,
  }) =>
      NewSharesResponse(
        data: data ?? this.data,
      );

  factory NewSharesResponse.fromJson(Map<String, dynamic> json) => NewSharesResponse(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final List<Share>? data;
  final Pagination? pagination;

  Data({
    this.data,
    this.pagination,
  });

  Data copyWith({
    List<Share>? data,
    Pagination? pagination,
  }) =>
      Data(
        data: data ?? this.data,
        pagination: pagination ?? this.pagination,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<Share>.from(json["data"].map((x) => Share.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );
}

class Share {
  final int id;
  final RegisterDataResponse? user;

  Share({
    required this.id,
    this.user,
  });

  factory Share.fromJson(Map<String, dynamic> json) => Share(
    id: json["id"],
    user: json["user"] == null ? null : RegisterDataResponse.fromJson(json["user"]),
  );

  Share copyWith({
    int? id,
    RegisterDataResponse? user,
  }) =>
      Share(
        id: id ?? this.id,
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
