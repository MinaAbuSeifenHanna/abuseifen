import 'dart:io';

import 'package:dio/dio.dart';

class AdvertiserDatasource {
  final Dio dio;

  AdvertiserDatasource({
    required this.dio,
  });

  Future<Response> createAdvertiser({
    required String firstName,
    required String lastName,
    required String companyName,
    required String brandName,
    required String weblink,
    required String email,
    required String phone,
    required File commercialDocument,
  }) async =>
      dio.post(
        'advertiser/create',
        data: FormData.fromMap({
          "first_name": firstName,
          "last_name": lastName,
          "company_name": companyName,
          "brand_name": brandName,
          "website_link": weblink,
          "email": email,
          "phone": phone,
          "commercial_document": await MultipartFile.fromFile(
            commercialDocument.path,
          ),
        }),
      );
}
